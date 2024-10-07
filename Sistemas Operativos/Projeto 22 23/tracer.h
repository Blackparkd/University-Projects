#ifndef TRACER_H
#define TRACER_H

#define SIZE 1024

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <stdbool.h>
#include <signal.h>
#include <time.h>
#include <fcntl.h>
#include <sys/types.h>
#include <limits.h>

void runCommand(char* command[]);
ssize_t readln(int fildes, void* buffer, size_t nbyte);
int runStatus(pid_t pid);

#endif 
