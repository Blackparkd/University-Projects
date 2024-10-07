#ifndef MONITOR_H
#define MONITOR_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <limits.h>
#include <stdbool.h>
#include <signal.h>

#define SIZE 1024

pid_t getpid(void);
pid_t getppid(void);
pid_t fork(void);
void _exit(int status);
pid_t wait(int *status);
pid_t waitPID(pid_t pid, int *status, int options); 

typedef struct process
{
    char *pid;
    char *program;
    char *time_s;
    char *time_f;
    struct process *next;
} *Process;

void signal_handler_C(int signum);

void addProcessoExecuted(Process* processo, char* program, char* pid, char* time_s);
void runExecuteI(Process* processo, char* program, char* pid, char* time_s);
void runExecuteF(Process* processo, char* pid, char* time_f);
int runStatus(Process* processo, char* pidIN);


#endif
