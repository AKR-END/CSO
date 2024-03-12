#include <stdio.h>
#include <stdlib.h>


extern int find_lonely(int* arr,int n);


int main(){
    int n;
    scanf("%d",&n);
    n = 2*n + 1;
    int* arr = (int*)malloc(n*sizeof(int));
    for(int i =0; i<n; i++){
        scanf("%d",&arr[i]);
    }
    printf("%d",find_lonely(arr,n));
}