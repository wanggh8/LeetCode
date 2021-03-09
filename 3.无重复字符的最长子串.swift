/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character: Int]()
        var start = -1
        var result = 0
        for (index, char) in s.enumerated() {
            let previousIndex = dic[char] ?? -1
            // 字符在字典中 且上次出现的下标大于当前长度的起始下标
            if previousIndex >= start {
                start = previousIndex
            }
            let currentLength = index - start
            result = max(result, currentLength)
            // 字符最后出现的下标
            dic[char] = index
        }
        return result
    }

}
// @lc code=end

