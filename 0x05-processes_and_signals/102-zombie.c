#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>

/**
 * inifinite_while - Runs an infinite loop
 * * Return: Always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - main entry point
 * Return: Always 0
 */
int main(void)
{
	int m;

	for (m = 0; m < 5; m++)
	{
		if (fork() == 0)
		{
			dprintf(1, "Zombie process created, PID: %d\n", getpid());
			return (0);
		}
	}
	infinite_while();
	return (0);
}
