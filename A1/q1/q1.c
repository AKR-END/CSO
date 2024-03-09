#include <stdio.h>
#include <stdlib.h>

typedef long long int lli;

lli find_lonely(lli* arr,int n){}


int main(){
    int n;
    scanf("%d",&n);
    int* arr = (int*)malloc(n*sizeof(int));
    for(int i =0; i<n; i++){
        scanf("%lld",&arr[i]);
    }
    printf("%lld",find_lonely(arr,n));
}