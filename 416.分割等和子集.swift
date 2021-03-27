/*
 * @lc app=leetcode.cn id=416 lang=swift
 *
 * [416] 分割等和子集
 */

// @lc code=start
// 找出和的一半，转化为背包问题
class Solution1 {
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        let n = nums.count
        for val in nums {
            sum += val
        }
        if sum % 2 != 0 {
            return false
        }
        sum /= 2
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: sum + 1), count: n + 1)
        for i in 0...n {
            dp[i][0] = true
        }

        for i in 1...n {
            for j in 1...sum {
                if j < nums[i - 1] {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i - 1]]
                }
            }
        }
        return dp[n][sum]
    }
}
// 动态规划状态压缩
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        let n = nums.count
        for val in nums {
            sum += val
        }
        if sum % 2 != 0 {
            return false
        }
        sum /= 2
        
        var dp = [Bool](repeating: false, count: sum + 1)
        dp[0] = true

        for i in 1...n {
            // 倒序遍历，防止本次遍历结果覆盖i-1次
            for j in stride(from: sum, to: 0, by: -1){
                if j < nums[i - 1] {
                    dp[j] = dp[j]
                } else {
                    dp[j] = dp[j] || dp[j - nums[i - 1]]
                }
            }
        }
        return dp[sum]
    }
}
// @lc code=end

