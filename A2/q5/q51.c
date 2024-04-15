#include <stdio.h>

long long bs(long long* arr, long long targ, long long* iterations);

int main(){
    long long arr[32];
    for(int i = 0; i<32; i++){
        scanf("%lld",&arr[i]);
    }
    long long targ;
    long long iterations = 0;
    scanf("%lld",&targ);

    long long result = bs(arr,targ,&iterations);
    printf("%lld %lld",result,iterations);
}