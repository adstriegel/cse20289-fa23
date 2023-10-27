
#include <stdio.h>
#include <string.h>

int main ()
{
    char myArray[20];
    char * pPointer;

    pPointer = myArray+2;

    printf("myArray:  %p\n", myArray);
    printf("pPointer: %p\n", pPointer);

    printf("sizeof(myArray): %lu\n", sizeof(myArray));    
    printf("sizeof(pPointer): %lu\n", sizeof(pPointer));    

    printf("Start: %s\n", myArray);

    strlcpy(myArray, "TEST-TEST", 20);
    printf("Start: %s\n", myArray);

    strlcpy(pPointer, "WHOO-WHOO", 20);
    printf("Start: %s\n", myArray);

    return 0;
}