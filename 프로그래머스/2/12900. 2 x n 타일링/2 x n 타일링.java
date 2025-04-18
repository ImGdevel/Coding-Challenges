class Solution {
    public int solution(int n) {
        long[] dp = new long[n+1];
        long MOD = 1000000007;
        dp[0] = 1; 
        dp[1] = 1;
        for(int i=2; i<=n; i++){
            dp[i] = (dp[i-1] + dp[i-2]) % MOD;
        }
        
        return (int) dp[n];
    }
}