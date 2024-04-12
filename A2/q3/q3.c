#include <stdio.h>
#include <string.h>


long long postfix(char* str, int n);


int main(){
    int n;
    scanf("%d\n",&n);

    char str[n+1];
    fgets(str,n+1,stdin);

    printf("%lld",postfix(str,n));

    return 0;
}
