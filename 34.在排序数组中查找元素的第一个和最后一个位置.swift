/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 */

// @lc code=start
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [leftBound(nums, target), rightBound(nums, target)]
    }

    func leftBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        if left >= nums.count || nums[left] != target {
            return -1
        } else {
            return left
        }
    } 

    func rightBound(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left) / 2
            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                left = mid + 1
            }
        }
        if right < 0 || nums[right] != target {
            return -1
        } else {
            return right
        }
    } 
}
// @lc code=end

