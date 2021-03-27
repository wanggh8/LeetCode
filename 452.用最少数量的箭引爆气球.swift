/*
 * @lc app=leetcode.cn id=452 lang=swift
 *
 * [452] 用最少数量的箭引爆气球
 */

// @lc code=start
class Solution {
    // 最多不重叠的区间（边界也算重叠）
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let n = points.count
        if n == 0 {
            return 0
        }

        // 把区间的尾从小到大排序
        let array = points.sorted { a, b in
            a[1] < b[1]
        }

        var count = 1
        var end = array[0][1]

        for i in array {
            if i[0] > end {
                count += 1
                end = i[1]
            }
        }
        return count
    }
}
// @lc code=end

