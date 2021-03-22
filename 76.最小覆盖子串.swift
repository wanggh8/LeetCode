/*
 * @lc app=leetcode.cn id=76 lang=swift
 *
 * [76] 最小覆盖子串
 */

// @lc code=start
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let array = [Character](s)
        // 所需字符的字典
        var need = [Character: Int]()
        // 窗口的字典
        var window = [Character: Int]()
        // 当前窗口的左右两端
        var left = 0
        var right = 0
        //  匹配need的次数，等于need的key数量时代表已经匹配完成
        var match = 0
        // 记录最小结果
        var minLen = Int.max
        var start = 0

        for c in t {
            need[c, default: 0] += 1
        }

        while right < array.count {
            // 右移窗口
            let c = array[right]
            right += 1
            if need[c] != nil {
                window[c, default: 0] += 1
                if window[c] == need[c] {
                    match += 1
                }
            }
            // 判断左侧窗口是否要收缩
            while match == need.count {
                // 在这里更新最小覆盖子串
                if right - left < minLen {
                    start = left;
                    minLen = right - left;
                }
                // 左移窗口
                let d = array[left]
                left += 1
                if need[d] != nil {
                    if need[d] == window[d] {
                        match -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        return minLen == Int.max ? "" : String(array[start..<(start + minLen)])
    }
}
// @lc code=end

