/*
 * @lc app=leetcode.cn id=567 lang=swift
 *
 * [567] 字符串的排列
 */

// @lc code=start
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let array = [Character](s2)
        var window = [Character: Int]()
        var need = [Character: Int]()
        var left = 0
        var right = 0
        var match = 0
        
        for c in s1 {
            need[c, default: 0] += 1
        }

        while right < array.count {
            let c = array[right]
            right += 1
            if need[c] != nil {
                window[c, default: 0] += 1
                if window[c] == need[c] {
                    match += 1
                }
            }

            while right - left >= s1.count {
                if match == need.count {
                    return true
                }

                let d = array[left]
                left += 1
                if need[d] != nil {
                    if window[d] == need[d] {
                        match -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
            return false
    }
}
// @lc code=end

