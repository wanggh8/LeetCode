/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子序和
 */

// @lc code=start
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        var dp = [Int](repeating: nums[0], count: n)
        for i in 1..<n {
            dp[i] = max(nums[i], dp[i - 1] + nums[i])
        }
        return dp.max()!
    }
}
// @lc code=end

