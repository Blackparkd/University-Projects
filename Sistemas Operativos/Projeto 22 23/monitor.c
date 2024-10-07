#include "monitor.h"

#define SIZE 1024

void signal_handler_C(int signum){

    unlink("args_fifo");
    write(1,"\nServer ending!\n",sizeof("\nServer ending!\n"));
    exit(0);
}

// ##################### *** FUNÇÕES GUARDAR DADOS EXECUTED *** ######################################################


void addProcessoExecuted(Process* processo, char *program, char *pid, char *time_s){
	Process novoProcesso = malloc(sizeof(struct process));
    novoProcesso->pid = strdup(pid);
    novoProcesso->program = strdup(program);
    novoProcesso->time_s = strdup(time_s);
    novoProcesso->time_f = NULL;

    novoProcesso->next = *processo; 

    *processo = novoProcesso;
}

// Guardar em memória informações do programa que é executado
void runExecuteI(Process* processo, char* program, char* pid, char* time_s){
	addProcessoExecuted(processo, program, pid, time_s);
}

// Guardar em memória o tempo final do programa que acaba de executar
void runExecuteF(Process* processo, char* pid, char* time_f){
	Process* auxProcesso; 
	auxProcesso = processo;
	while(*auxProcesso != NULL){
		if(!strcmp((*auxProcesso)->pid, pid)){
			(*auxProcesso)-> time_f = time_f;
		}
		auxProcesso = &((*auxProcesso)->next);
	}
}


// ############################## *** FUNÇÃO STATUS *** ###########################################

int runStatus(Process* processo, char* pidIN){

	// Abertura do fifo de comunicação único com o Tracer
	int fdToTracer = open(pidIN,O_WRONLY);

	char bufTracer[SIZE];
	struct timeval finish_time;
	ssize_t nbytes = 0;
	
	// Percorrer memória à procura de programas por terminar
	Process* auxProcesso;
	auxProcesso = processo;
		
	while(*auxProcesso != NULL){
		if((*auxProcesso)->time_f == NULL){
			
			char* pid = (*auxProcesso)->pid;
			char* program = (*auxProcesso)->program;
			
			unsigned long long start;
			sscanf ((*auxProcesso)->time_s, "%llu", &start);
			gettimeofday(&finish_time, NULL);
			unsigned long long finish = (finish_time.tv_sec)*1000000 + (finish_time.tv_usec);
			unsigned int time = (finish - start)/1000 + (finish - start)%1000;

			nbytes = sprintf(bufTracer, "%s %s %u ms\n", pid, program, time);
			write(fdToTracer, bufTracer, nbytes);
		}
		auxProcesso = &((*auxProcesso)->next);
	}

	// Fechar descritores
	close(fdToTracer);


	return 0;
}



/*
############################################################################

							*** MAIN ***

############################################################################
*/


int main(int argc, char *argv[]){

	// Termina o servidor com ctrl+c
    signal(SIGINT,signal_handler_C);

    Process processo = NULL;
	
	// Criação do fifo de argumentos do Tracer
	int args_fifo = mkfifo("args_fifo",0666);

	if(args_fifo == -1){
		perror("Args fifo unopened");
		return -1;
	}

	while(1){

		char* buffer = malloc(sizeof(char)*SIZE);

		// Abertura do fifo de argumentos do Tracer
		int fdArgs = open("args_fifo",O_RDONLY);

		read(fdArgs, buffer, 1); 
		
		// String da forma -> "UI%05lu%d %s %d\n"
 		// U -> Execute -u | I -> Inicio | %05lu -> Nr de bytes a ler a seguir
 		// %d %s %d -> PID, Programa, Tempo de início

		if(buffer[0] == 'U'){	        // U -> EXECUTE -U
			read( fdArgs,buffer, 6);
			
			if(buffer[0] == 'I'){   	// I -> Start client
				int bytes_to_read = atoi(&buffer[1]);

				read(fdArgs, buffer, bytes_to_read);
			
				char* string;
				char* args[20];
				int i = 0;

				char* command = strdup(buffer);

				while((string = strsep(&command," "))!= NULL){
					args[i] = string;
					i++;
				}
				args[i] = NULL;

				char* pid = args[0];   		//pid
				char* program = args[1];   	//programa
				char* time_s = args[2];  	//tempo inicial


				// I PARA INICIO, F PARA FIM        
				// cria nova célula na lista ligada, adicionada à cabeça
				runExecuteI(&processo, program, pid, time_s);
			}
			
			else if(buffer[0] == 'F'){ 			// F -> Finish client 
				int bytes_to_read = atoi(&buffer[1]);

				read(fdArgs, buffer, bytes_to_read);
			
				char* string;
				char* args[20];
				int i = 0;

				char* command = strdup(buffer);

				while((string = strsep(&command," "))!= NULL){
					args[i] = string;
					i++;
				}
				args[i] = NULL;

				char* pid = args[0];
				char* time_f = args[1];

				// Adiciona tempo final à célula com o respectivo PID
				runExecuteF(&processo, pid, time_f);
			}
		}

		else if(!strncmp(buffer,"S",1)){         // S -> STATUS
			
			read(fdArgs, buffer, 10);
						
			runStatus(&processo, buffer);   //o pid esta guardado no buffer
		}

		// Fechar descritores e dar free da memória alocada
		close(fdArgs);
		free(buffer);
	}
	return 0;
}		