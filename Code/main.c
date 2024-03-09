#include <stdio.h>
#include "foo.h"
 
int main(void)
{
    printf("This is a shared library test...");
    foo();
    return 0;
}