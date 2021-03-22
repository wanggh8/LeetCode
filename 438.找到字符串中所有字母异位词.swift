/*
 * @lc app=leetcode.cn id=438 lang=swift
 *
 * [438] 找到字符串中所有字母异位词
 */

// @lc code=start
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var array = [Character](s)
        var need = [Character: Int]()
        var window = [Character: Int]()
        var left = 0
        var right = 0
        var match = 0
        var res = [Int]()

        for c in p {
            need[c, default: 0] += 1
        }

        while right < array.count {
            let c = array[right]
            right += 1
            if need[c] != nil {
                window[c, default: 0] += 1
                if need[c] == window[c] {
                    match += 1
                }
            }

            while match == need.count {
                if right - left == p.count {
                    res.append(left)
                }
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
        return res
            
    }
}
// @lc code=end

