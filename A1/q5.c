#include <stdio.h>
#include <stdlib.h>

long long int* product_except_i(long long int* arr, long long int* res, long long int n);

int main(){
    long long int n;
    scanf("%lld",&n);

    long long int* arr = (long long int*)malloc(n*sizeof(long long int));
    for(long long int i = 0; i<n ; i++){
        scanf("%lld",&arr[i]);
    }
    long long int* res = (long long int*)malloc(n*sizeof(long long int));
    product_except_i(arr,res,n);
    for(long long int i = 0; i<n ; i++){
        printf("%lld ",res[i]);
    }
}