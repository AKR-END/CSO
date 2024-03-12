#include <stdio.h>
#include <stdlib.h>


extern long long int find_lonely(long long int* arr,int n);


int main(){
    int n;
    scanf("%d",&n);
    n = 2*n + 1;
    long long int* arr = (long long int*)malloc(n*sizeof(long long int));
    for(int i =0; i<n; i++){
        scanf("%lld",&arr[i]);
    }
    printf("%lld",find_lonely(arr,n));
}