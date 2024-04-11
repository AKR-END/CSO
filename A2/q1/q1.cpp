#include <iostream>
#include <vector>
#include <cstdlib>

using namespace std;




signed main(){
    long long n,l,r;
    cin>>n>>l>>r;

    vector<long long> arr(n);
    for(long long i = 0; i<n ; i++){
        cin>>arr[i];
    }

    long long sum = 0;
    long long start = 0;

    for(long long i = 0; i<l ; i++){
        sum+=arr[i];
    }

    long long max = sum;

    for(long long i = l; i<n; i++){
        sum+=arr[i];
        sum-=arr[i-l];
        if(max<sum){
            max = sum;
            start = i - l + 1;
        }
    }
    // cout<<start<<" "<<max<<endl;

    long long size = l;
    long long left = start;
    long long right = start+l - 1;


    long long temp = max;
    while(size<r){
        if(left - 1 >= 0 && right + 1 < n ){
            if(arr[left - 1] > arr[right + 1]){
                temp+=arr[--left];
            }else{
                temp+=arr[++right];
            }
        }else if(left - 1 > 0){
            temp+=arr[--left];
        }else if(right + 1 < n){
            temp+=arr[++right];
        }
        size++;

        if(max<temp) max = temp;
    }

    cout<<max<<endl;
}