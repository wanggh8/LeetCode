/*
 * @lc app=leetcode.cn id=518 lang=swift
 *
 * [518] 零钱兑换 II
 */

// @lc code=start
class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        if amount == 0 {
            return 1
        }
        if n == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: amount + 1), count: n + 1)
        for i in 0...n {
            dp[i][0] = 1
        }
        

        for i in 1...n {
            for j in 1...amount {
                if j < coins[i - 1] {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - coins[i - 1]]
                }
            }
        }
        return dp[n][amount]
    }
}
// @lc code=end

