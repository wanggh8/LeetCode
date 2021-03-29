/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 */

// @lc code=start
class Solution1 {

    var res: [[Int]] = []
    var vis = [Bool]()

    func permute(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        backtrack(nums, &track)
        return res
    }
    // 回溯
    func backtrack(_ nums: [Int], _ track: inout [Int]) {
        if nums.count == track.count {
            res.append(track)
        }

        for i in nums {
            if track.contains(i) {
                continue
            }
            track.append(i)
            backtrack(nums, &track)
            track.removeLast()
        }
    }
    
}
// 回溯算法
class Solution {

    var res = [[Int]]()
    var visited = [Bool]()
    var stack = [Int]()

    func permute(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        visited = [Bool](repeating: false, count: n)
        backtrack(nums)
        return res
    }
    
    func backtrack(_ nums: [Int]) {
        let n = nums.count
        if n == stack.count {
            res.append(stack)
        }

        for i in 0..<n {
            if visited[i] == true {
                continue
            }
            stack.append(nums[i])
            visited[i] = true
            backtrack(nums)
            visited[i] = false
            stack.removeLast()
        }
    }
      
}
// @lc code=end

