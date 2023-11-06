/* badcode.c : Is this code bad? */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int * myFunction ()
{
    int nValue;

    nValue = 15;

    return &nValue;
}

int main ()
{
    char myArray[20];
    int  nValue;
    int * pVal = NULL;

    /* Which is better? */
    memset(myArray, 0, sizeof(char) * 20);
    memset(&nValue, 0, sizeof(int));

    pVal = myFunction();

    char diffArray[50];
    memset(diffArray, 0, sizeof(diffArray));

    printf("%d\n", *pVal);

    return 0;
}
