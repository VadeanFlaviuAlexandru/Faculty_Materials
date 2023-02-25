#include<stdio.h>
#define MAX_FILE_NAME 100

//write a C program that counts the number of characters on each line of a text file.
//Make no assumptions regarding the maximum length of a line

int main()
{
	FILE *file;
	char input[MAX_FILE_NAME];

        char c;
        int count = 0;
        int i = 0;

	printf("Enter the name of the file: ");
	scanf("%s", input);
	file=fopen(input,"r");
	if(file == NULL)
	{
		printf("Error\n");
		return 0;
	}

	while(!feof(file))
	{
		count=0;
		c=fgetc(file);
		while(( c != '\n' ) && ( c != EOF ))
		{
			if( c != ' ')
			{
				count = count + 1;
			}
			c = fgetc(file);
		}
		++i;
		printf("On line %d, there are %d letters \n",i,count);
	}
	return 0;
}
