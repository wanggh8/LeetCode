/*
 * @lc app=leetcode.cn id=435 lang=swift
 *
 * [435] 无重叠区间
 */

// @lc code=start
class Solution {
    // 求出不想交的区间的最大值
    // 总区间减去
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var n = intervals.count
        if n < 2 {
            return 0
        }
        let array = intervals.sorted { a, b in
            return a[1] < b[1]
        }
        print(array)
        var count = 1
        var end = array[0][1]
        for i in array {
            if i[0] >= end {
                count += 1
                end = i[1]
            }
        }
        return n - count
    }
}
// @lc code=end

