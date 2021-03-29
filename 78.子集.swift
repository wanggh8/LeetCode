/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 */

// @lc code=start
class Solution {
    
    var res = [[Int]]()
    var stack = [Int]()

    func subsets(_ nums: [Int]) -> [[Int]] {
        backtrack(nums, 0)
        return res
    }

    func backtrack(_ nums: [Int], _ start: Int) {
        let n = nums.count
        if start > n {
            return
        }
        res.append(stack)

        for i in start..<n {
            stack.append(nums[i])
            backtrack(nums, i + 1)
            stack.removeLast()
        }
    }
}
// @lc code=end

