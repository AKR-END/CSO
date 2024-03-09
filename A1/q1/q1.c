#include <stdio.h>
#include <stdlib.h>

typedef long long int lli;

extern lli find_lonely(lli* arr,int n);


int main(){
    int n;
    scanf("%d",&n);
    lli* arr = (lli*)malloc(n*sizeof(lli));
    for(int i =0; i<n; i++){
        scanf("%lld",&arr[i]);
    }
    printf("%lld",find_lonely(arr,n));
}