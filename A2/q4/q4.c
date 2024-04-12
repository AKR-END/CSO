#include <stdio.h>
#include <string.h>


long long game(char* str, int n);


int main(){
    int n;
    scanf("%d\n",&n);

    char str[n];
    for(int i = 0; i<n ; i++){
        scanf("%c",&str[i]);
    }

    printf("%lld",game(str,n));

    return 0;
}
