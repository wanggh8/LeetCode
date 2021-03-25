/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长递增子序列
 */

// @lc code=start
class Solution {
    // 动态规划
    // O(n^2)
    func lengthOfLIS1(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 1, count: n)
        for i in 0..<n {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        return dp.max()!
    }
    // 二分 扑克牌
    // O(nlogn)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var top = [Int](repeating: 0, count: n)
        // 牌堆数初始化为 0
        var piles = 0;
        for i in 0..<n {
            let poker  = nums[i]
            var left = 0
            var right = piles
            while left < right {
                let mid = left + (right - left) / 2
                if top[mid] >= poker {
                    right = mid
                } else {
                    left = mid + 1
                }
            }  

            if left == piles {
                piles += 1
            } 
            top[left] = poker
        }
        return piles
    }
}
// @lc code=end

