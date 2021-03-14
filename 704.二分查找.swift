/*
 * @lc app=leetcode.cn id=704 lang=swift
 *
 * [704] 二分查找
 */

// @lc code=start
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            }
        }
        return -1
    }
}
// @lc code=end

