#include <stdio.h>
#include <stdlib.h>
#define int long long




// int_fast8_t max_sub(int_fast8_t *arr, int_fast8_t n, int_fast8_t l, int_fast8_t r);

signed main(){
    long long n,l,r;
    scanf("%lld %lld %lld",&n,&l,&r);

    int* arr = malloc(sizeof(int)*n);
    int* prefix_sum = malloc(sizeof(int)*n);

    int sum = 0;

    for(int i = 0; i<n ; i++){
        scanf("%lld",&arr[i]);
        sum+=arr[i];
        prefix_sum[i] = sum;
    }

    
   
    int start = 0;
    int min = arr[0];
    int max = prefix_sum[l-1] - prefix_sum[0];

    for()

    int size = l;
    int left = start;
    int right = start+l - 1;


    int temp = max;
    while(size<r){
        if(left - 1 >= 0 && right + 1 < n ){
            if(arr[left - 1] > arr[right - 1]){
                temp+=arr[--left];
            }else{
                temp+=arr[++right];
            }
        }else if(left - 1 > 0){
            temp+=arr[--left];
        }else if(right + 1 < n){
            temp+=arr[--right];
        }
        size++;

        if(max<temp) max = temp;
    }

    printf("%lld",max);
}