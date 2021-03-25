/*
 * @lc app=leetcode.cn id=354 lang=swift
 *
 * [354] 俄罗斯套娃信封问题
 */

// @lc code=start
class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        // 按宽度升序排列，如果宽度一样，则按高度降序排列
        var array = envelopes.sorted(by: { a, b in
             return a[0] == b[0] ? a[1] > b[1] : a[0] < b[0]
        })
        // 对高度数组寻找 LIS
        var heights = array.map { a -> Int in
            return a[1]
        }

        let n = heights.count
        if n < 2 {
            return n
        }
        var dp = [Int](repeating: 1, count: n)
    
        for i in 0..<n {
            for j in 0..<i {
                if heights[i] > heights[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                } 
            }
        }
        return dp.max()!
    }
}
// @lc code=end

