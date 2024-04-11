#include <stdio.h>
#include <stdlib.h>

long long int sum_max_min(long long int* arr, long long int n);

int main(){
    long long int n;
    scanf("%lld",&n);

    long long int* arr = (long long int*)malloc(n*sizeof(long long int));
    for(long long int i =0; i<n ; i++){
        scanf("%lld",&arr[i]);
    }
    printf("%lld",sum_max_min(arr,n));
}