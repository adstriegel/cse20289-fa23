
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int thatIsWeird (int * pVal); 
/* int thatIsWeird (int * pVal); */

int main ()
{
    int nVal = 3;
    thatIsWeird(&nVal);
    return 0;
}
