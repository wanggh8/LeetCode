/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 */

// @lc code=start
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        var farthestIndex = 0
        for i in 0..<n-1 {
            farthestIndex = max(farthestIndex, i + nums[i]) 
            if farthestIndex <= i {
                return false
            }
            
        }
        return farthestIndex >= n - 1
    }
}
// @lc code=end

