/*
 * @lc app=leetcode.cn id=72 lang=swift
 *
 * [72] 编辑距离
 */

// @lc code=start
// 动态规化
// dp为二组数组
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let s1 = [Character](word1)
        let s2 = [Character](word2)
        let m = s1.count
        let n = s2.count
        if (m == 0) {
            return n
        }
        if (n == 0) {
            return m
        }
        var dp = [[Int]]()
        // base case 
        // x，y 为0时
        dp.append([Int](0...n))
        for i in 1...m {
            dp.append([Int](repeating: i, count: n + 1))
        }
        
        for i in 1...m {
            for t in 1...n {
                if s1[i - 1] == s2[t - 1] {
                    dp[i][t] = dp[i - 1][t - 1]
                } else {
                    dp[i][t] = min(dp[i - 1][t] + 1, dp[i - 1][t - 1] + 1, dp[i][t - 1] + 1)
                }
            }
        }
        return dp[m][n]
    }
}
// @lc code=end

