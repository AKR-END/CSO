#include <stdio.h>
#include <stdlib.h>


long long max_subarray(long long* arr, long long n, long long l, long long r,long long* deque, long long* pre);

int main(){
    long long n, l, r;
    scanf("%lld %lld %lld", &n, &l, &r);

    long long* arr = (long long*)malloc(n*sizeof(long long));
    long long* deque = (long long*)malloc(n*sizeof(long long));
    long long* pre = (long long*)malloc(n+1*sizeof(long long));

    for(long long i=0; i<n; i++){
        scanf("%lld", &arr[i]);
    }

    printf("%lld\n", max_subarray(arr, n, l, r, deque, pre));
    return 0;
}


or(int i=1;i<=n;i++){
        pre[i]=pre[i-1]+a[i];
    }

    int deque[n+1];
    int deque_l=0;
    int deque_r=0;

    int ans = -1e8;

    for(int i=l;i<=n;i++){

        while(deque_r != deque_l && pre[i-l] < pre[deque[deque_r-1]]) 
            deque_r--;
        deque[deque_r] = i-l;
        deque_r++;
        if(deque[deque_l] < i-r)
            deque_l++;

        ans = max(ans,pre[i]-pre[deque[deque_l]]);
    }
