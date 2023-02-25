#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

//exercitiu 13
//divide et impera method

int main()
{
	int pid;
	int pid2;
	int size;
	int i;
	int result;
	result = 1;
	int status;

	printf("We gonna create an array.");
	printf("Please enter an even size: ");      
	scanf("%d",&size);
	

	while(size%2!=0)
	{		
		printf("I said, please enter an even size: ");
		scanf("%d",&size);
	}

	int array[size];
	
	for(i=0;i<size;i++)
	{	
		printf("Enter the number on position %d: ", i+1);
		scanf("%d",&array[i]);
	}
	printf("\n---------------------------------------\n");
	printf("This is the array you created: ");
	for(i=0;i<size;i++)
        {
                printf("%d",array[i]);
        }	
	printf("\n");

	int firstSub[size/2];
	int secondSub[size/2];
	
	for (i=0; i<size/2; i++)
	{
		firstSub[i]=array[i];
		secondSub[i]=array[size/2+i];
	}
	
	printf("This is the first sub-array created: ");
	
	for(i=0;i<size/2;i++)
        {
		
                printf("%d",firstSub[i]);
        }
	
	printf("\n");
	
	printf("This is the second sub-array created: ");
	for(i=0;i<size/2;i++)
        {
                printf("%d",secondSub[i]);
	}
	printf("\n-------------------------------------");
	printf("\n");
	
	pid=fork();
	
	if(pid==-1)
	{
		perror("A error has appeared surprisingly: ");
		exit(EXIT_FAILURE);	
	}
	if(pid==0)
	{
		printf("\n[___IN CHILD___]\n\nStarting...\n");
		for(i=0;i<size/2;i++)	
		{
			result=result*firstSub[i];
		}
		printf("The result of this sub-array is %d\nExiting...\n[___IN CHILD___]\n\n", result);
		exit(result);
	}	
	else
	{
		printf("\n[___IN PARENT___]\n\nStarting...\n");
		wait(&status);
		printf("Child has finished. The exit status was: %d\n", status);
		result=WEXITSTATUS(status);
		
		pid2=fork();

		if(pid2==-1)
		{
			perror("A error has appeared surprisingly: ");
	                exit(EXIT_FAILURE);
		}
		if(pid2==0)
		{
			for(i=0;i<size/2;i++)
			{
				result=result*secondSub[i];
			}
			printf("The result of the second sub-array multiplied by the first sub-array is %d\nExiting...\n[___IN CHILD___]\n\n", result);
	                exit(result);

		}
		else
		{
			printf("\n[___IN PARENT___]\nStarting...\n");
        	        wait(&status);
	                printf("Child has finished. The exit status was: %d\n", status);
                	result=WEXITSTATUS(status);
		}
		printf("I finished.[___IN PARENT___]\n\n");
	}
	
	printf("\n___________________\n\n");
	printf("In conclusion, the product of both sub-arrays is: %d", result);
	printf("\n___________________\n\n");

	return 0;


}
