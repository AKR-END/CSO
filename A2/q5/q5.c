#include <stdio.h>

long long bs(long long* arr,long long target,long long* interations);
// {
//     int l = 0;
//     int r = 31;
//     while(l<r){
//         *interations += 1;
//         int mid = (l+r)/2;
//         if(arr[mid] == target){
//             r = mid;
//         }else if(arr[mid] > target){
//             r = mid - 1;
//         }else{
//             l = mid + 1;
//         }
//     }
//     return l;
// }


int main(){
    long long arr[32];
    for(int i = 0; i<32 ; i++){
        scanf("%lld",&arr[i]);
    }
    long long target;
    scanf("%lld",&target);

    
    long long iterations = 0;
    long long result = bs(arr,target,&iterations);

    printf("%lld %lld",result,iterations);

    return 0;
}