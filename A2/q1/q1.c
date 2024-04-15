#include <stdio.h>
#include <stdlib.h>


long long max_subarray(long long* arr, long long n, long long l, long long r,long long* pre, long long* deque);

int main(){
    long long n, l, r;
    scanf("%lld %lld %lld", &n, &l, &r);

    long long* arr = (long long*)malloc(n*sizeof(long long));
    long long* deque = (long long*)malloc(n*sizeof(long long));
    long long* pre = (long long*)malloc(n+1*sizeof(long long));

    for(long long i=0; i<n; i++){
        scanf("%lld", &arr[i]);
    }

    printf("%lld\n", max_subarray(arr, n, l, r, pre, deque));
    return 0;
}

