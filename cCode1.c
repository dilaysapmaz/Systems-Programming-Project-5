#include <stdio.h> 
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#define FILENAME 100 
  
int main() 
{ 
    FILE *fp; 
    int count = 0;  // row counter 
    char filename[FILENAME]; 
    char c;  // storing the chars in that file

    printf("Enter file name: "); 
    scanf("%s", filename); 
  
    fp = fopen(filename, "r");  // open the file 
  
    // check if file exists 
    if (fp == NULL) 
    { 
        printf("Failed to open %s", filename); 
        return 0; 
    } 
  
    // reading from a file and storing in c. It goes when not reached to
    // EOF(end of file)
    for (c = getc(fp); c != EOF; c = getc(fp)) 
        if (c == '\n'){ // if it is a new line, increment 
            count = count + 1; 
  }
    // closing the file 
   fclose(fp);
    printf("The file %s has %d lines\n ", filename, count); 
	char answer;
	printf("Do you want to lock that file? (y,n)");
	gets(answer);

//trying to lock a file.
	if(answer=='y'){
		lockf(fp, LOCK_SH);
		printf("File is locked.");
	}else if(answer=='n')
		printf("File cannot locked.");
	else{
		printf("Please enter y or n letters.");
		gets(answer);
	}
    return 0; 
} 
