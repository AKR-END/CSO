#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int palindrome(char* arr,long long int n);


int main(){
    char* arr = (char*)malloc(1000000*sizeof(char));
    scanf("%s",arr);

    long long int n = strlen(arr);

    printf("%d",palindrome(arr,n));
}