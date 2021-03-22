/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
    // 双指针
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character: Int]()
        var result = 0
        var start = -1
        var previousIndex = -1

        for (index, char) in s.enumerated() {
            previousIndex = dic[char] ?? -1
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
    // 滑动窗口
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var window = [Character: Int]()
        let array = [Character](s)
        var left = 0
        var right = 0
        var res = 0
        while right < array.count {
            // 进行窗口内数据的一系列更新
            let c = array[right]
            right += 1
            window[c, default: 0] += 1
            // 左侧窗口收缩
            var cNum = window[c] ?? 0
            while cNum > 1 {
                let d =  array[left]
                left += 1
                window[d]! -= 1
                cNum = window[c] ?? 0
            }
            res = max(res, right - left);
        }
        return res
        
    }

}
// @lc code=end

