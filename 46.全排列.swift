/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 */

// @lc code=start
class Solution {

    var res: [[Int]] = []
    var vis = [Bool]()

    func permute(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        vis = Array.init(repeating: false, count: nums.count)
        backtrack(nums, &track)
        return res
    }
    // 回溯
    func backtrack(_ nums: [Int], _ track: inout [Int]) {
        if nums.count == track.count {
            res.append(track)
        }

        for (i, val) in nums.enumerated() {
            if vis[i] {
                continue
            }
            track.append(val)
            vis[i] = true
            backtrack(nums, &track)
            track.removeLast()
            vis[i] = false 
        }
    }

    func permute1(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        backtrack(nums, &track)
        return res
    }
    // 回溯
    func backtrack1(_ nums: [Int], _ track: inout [Int]) {
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
// @lc code=end

