#include <stdio.h>
#include <stdlib.h>


long long comb(long long n, long long r){
    if(r == 0 || r == n) return 1;
    if(r == 1) return n;
    return comb(n-1,r-1) + comb(n-1,r);
}

int main(){
    long long n,r;
    scanf("%lld %lld",&n,&r);

    printf("%lld",comb(n,r));
}