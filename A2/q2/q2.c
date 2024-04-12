#include <stdio.h>
#include <stdlib.h>


long long comb(long long n, long long r);

int main(){
    long long n,r;
    scanf("%lld %lld",&n,&r);

    printf("%lld",comb(n,r));
}