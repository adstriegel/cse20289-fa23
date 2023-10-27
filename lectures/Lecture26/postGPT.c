#include <stdio.h>
#include <string.h>

int main ()
{
    char myArray[20];
    char * pPointer;

    pPointer = myArray + 2;

    printf("myArray: %p\n", (void *)myArray);
    printf("pPointer: %p\n", (void *)pPointer);

    printf("sizeof(myArray): %lu\n", sizeof(myArray));    
    printf("sizeof(pPointer): %lu\n", sizeof(pPointer));    

    printf("Start: %s\n", myArray);

    strncpy(myArray, "TEST-TEST", sizeof(myArray));
    printf("Start: %s\n", myArray);

    // Calculate the remaining space in myArray based on pPointer's position
    size_t remaining_space = sizeof(myArray) - (pPointer - myArray);
    strncpy(pPointer, "WHOO-WHOO", remaining_space);
    printf("Start: %s\n", myArray);

    return 0;
}
