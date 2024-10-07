#include "tracer.h"

// ################################# FUNÇÃO EXECUTE -U #####################################

void runCommand(char* command[]){
	
	char args[SIZE];
	char buffer[SIZE];
	int nArgs = 0;
	
	// Medir o tempo inicial
	struct timeval start_time, finish_time;
  	gettimeofday(&start_time, NULL);
	unsigned long long start = (start_time.tv_sec)*1000000 + (start_time.tv_usec);


	// Abertura do fifo de argumentos do Tracer
	int fdMonitor = open("args_fifo",O_WRONLY);

	
	pid_t f = fork();

	if(f < 0)
		perror("Fork error");

	else if (f == 0){
		int nbytesOut, nbytesServer;
		pid_t pid = getpid();


		// Passar infos ao monitor
		nArgs = sprintf(args, "%d %s %llu", pid, command[0], start);
		nbytesServer = sprintf(buffer,"UI%05d%d %s %llu",nArgs, pid, command[0], start);
		write(fdMonitor, buffer, nbytesServer);

		
		// Informar utilizador do PID a executar
		nbytesOut = sprintf(buffer,"\nRunning PID %d\n\n", pid);
		write(1, buffer, nbytesOut);

		
		// Execução de execute -u
		execvp(command[0],command);  

		write(2,"Error: Exec failed\n",sizeof("Error: Exec failed\n"));

		_exit(0);
		
	}else{

		int status;
		wait(&status);

		//Verificação de sucesso da execução do processo-filho
		// e medição da duração da execução
		if(WIFEXITED(status)){
			gettimeofday(&finish_time, NULL);
			unsigned long long finish = (finish_time.tv_sec)*1000000 + (finish_time.tv_usec);
			unsigned int tempo = (finish - start)/1000 + (finish - start)%1000;
			
			int nbytesServer;
			
			//Informar o monitor do fim da execução
			nArgs = sprintf(args, "%d %llu", f, finish);
			nbytesServer = sprintf(buffer,"UF%05d%d %llu",nArgs, f, finish);
			write(fdMonitor, buffer, nbytesServer);


			//Informar o utilizador do fim da execução e respetivo tempo
			int read_bytes = sprintf(buffer,"\nEnded in %u ms\n",tempo);
			write(1, buffer, read_bytes);
		}
		else 	//Em caso de processo-filho mal executado
			write(2, "Error: Program interrupted", sizeof("Error: Program interrupted")); 
	}

	// Fechar descritores
	close(fdMonitor);
}

// ########################### FUNÇÃO STATUS #########################################

ssize_t readln(int fildes, void* buffer, size_t nbyte){ // Função readline
	char* cbuffer = (char*) buffer;
	char c;
	int i = 0;
	while(read(fildes, &c, nbyte) && c != '\n'){
		cbuffer[i] = c;
		i++;
	}
	if(c == '\n'){
		cbuffer[i++] = '\n';
	}
	cbuffer[i] = '\0';
	return i;
}


int runStatus(pid_t pid){

	char buffer[SIZE];
	char bufPID[11]; 	// não passa dos 10 Args  //e o pid!
	int nbytesServer;
	size_t n;          // retorno da readline

	// Abertura do fifo de argumentos do Tracer
	int fdMonitor = open("args_fifo",O_WRONLY);
	
	// Armazena na string bufPID o pid do processo que executa status
	sprintf(bufPID, "%010u", pid);

	// Cria um fifo de comunicação único com o Monitor  
	int fdMon = mkfifo(bufPID,0666);

	if(fdMon == -1){
		perror("Fifo unopened");
		return -1;
	}

	// Informa o Monitor que está a executar Status
	nbytesServer = sprintf(buffer, "S%s", bufPID);
	write(fdMonitor, buffer, nbytesServer);

	// Abertura do fifo de comunicação único com o Monitor
	int fdStatMonitor = open(bufPID,O_RDONLY, O_NONBLOCK);
	
	// Separação da informação recebida por '\n' e escrita no STDOUT
	while((n = readln(fdStatMonitor, buffer, 1)) > 1){
		write(1, buffer, n);      //buffer tem a informacao da status
	}

	// Fechar descritores e unlink do Fifo único criado
	close(fdMonitor);
	unlink(bufPID);
	return 0;
}
 
/*
############################################################################

							*** MAIN ***

############################################################################
*/

int main(int argc, char *argv[]){

	if (argc < 2){
		write(2, "Error: Command unknown\n", sizeof("Error: Command unknown\n"));
		return -1;
	}

	if(!strcmp(argv[1],"execute") && !strcmp(argv[2],"-u")){  // CORRE O EXECUTE -U
		if(argc<4){
			write(2,"Error: No program inserted\n",sizeof("Error: No program inserted\n"));
			return -1;
		}
		else{
			runCommand(&argv[3]);
		}
	}

	else if(strcmp(argv[1],"status") == 0){ // CORRE O STATUS
		pid_t pid = getpid();
		runStatus(pid);
	
	}else{
		write(2,"Error: Command unknown\n",sizeof("Error: Command unknown\n"));
		return -1;
	}

	return 0;
}