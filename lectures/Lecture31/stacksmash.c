// stacksmash.c

#include <stdio.h>
#include <string.h>

void myFunction (char * pDest)
{
    int nMyVar = 0;

    printf("nMyVar: %p\n", &nMyVar);
    strcpy(pDest, "TestTestTestTest");
}

int main ()
{
    char firstString[10];
    char secondString[10];

    printf("firstString:  %p\n", firstString);
    printf("secondstring: %p\n", secondString);
    printf("myFunction:   %p\n", myFunction);

    strcpy(firstString, "GO");
    strcpy(secondString,"IRISH");

    printf("First: %s vs. Second: %s\n", firstString, secondString);

    myFunction(secondString);

    printf("First: %s vs. Second: %s\n", firstString, secondString);

    return 0;
}