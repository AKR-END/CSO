#include <stdio.h>

long long bs(short* arr, short targ, short* iterations);

int main(){
    short arr[32];
    for(int i = 0; i<32; i++){
        scanf("%hd",&arr[i]);
    }
    short targ;
    short iterations = 0;
    scanf("%hd",&targ);

    long long result = bs(arr,targ,&iterations);
    if(result == -1){
        printf("-1");
    }else{
        printf("%lld %d",result,iterations);
    }
}