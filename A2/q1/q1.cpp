#include <iostream>
#include <vector>
#include <cstdlib>
#include <limits.h>

using namespace std;




signed main(){
    long long n,l,r;
    cin>>n>>l>>r;

    vector<long long> arr(n);
    vector<long long> prefix_sum(n,0);
    long long sum = 0;

    for(long long i = 0; i<n ; i++){
        cin>>arr[i];
        sum+=arr[i];
        prefix_sum[i] = sum;
    }
    long long max = 0;
    for(int i = l - 1; i<n; i++){
        long long cur = INT_MIN;
        if (i == l - 1){
            cur = prefix_sum[i];
        }else{
            cur = prefix_sum[i] - prefix_sum[i-l];
        }
        
        if(max<cur) max = cur;
    }
    vector<long long> max_start;

    for(int i = l; i<n; i++){
        long long curr = prefix_sum[i] - prefix_sum[i-l];
        if(max == curr) max_start.push_back(i-l);
    }
    for(long long ele: max_start){
        long long temp = max;
        long long size = l;
        long long left = ele+1;
        long long right = ele + l;
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
    }
    cout<<max<<endl;
}