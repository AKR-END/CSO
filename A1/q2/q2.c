#include <stdio.h>
#include <stdlib.h>


long long int rotate(long long int* arr,int n);


int main(){
    int n;
    scanf("%d",&n);

    long long int* arr = (long long int*)malloc(n*sizeof(long long int));
    for(int i =0; i<n; i++){
        scanf("%lld",&arr[i]);
    }

    rotate(arr,n);
    for(int i =0; i<n; i++){
        printf("%lld ",arr[i]);
    }
}