/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    // 字典法
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index1, num1) in nums.enumerated() {
            if let index2 = dict[target - num1] {
                return [index1, index2]
            } else {
                dict[num1] = index1
            }
           
        }
        return []
        
    }
}
// @lc code=end
    // 暴力破解
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (index1, num1) in nums.enumerated() {
            for (index2, num2) in nums.enumerated() {
                if index1 != index2 && num1 + num2 == target {
                    return [index1, index2]
                }
            }
        }
        return []
        
    }

