/*
 * @lc app=leetcode.cn id=10 lang=swift
 *
 * [10] 正则表达式匹配
 */

// @lc code=start
class Solution {
    var str1 = [Character]()
    var str2 = [Character]()
    func isMatch(_ s: String, _ p: String) -> Bool {
        str1 = [Character](s)
        str2 = [Character](p)
        let sLen = str1.count
        let pLen = str2.count
        // p 为空串时
        if pLen == 0 {
            return str1.isEmpty
        }
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: pLen + 1), count: sLen + 1)
        // s、p 为空串
        dp[0][0] = true
        for i in 0...sLen {
            for j in 1...pLen {
                if str2[j - 1] == "*" {
                   if match(i, j - 1) {
                        // 1、匹配*前1个字符，并且可继续匹配前面的字符
                        // 2、匹配*前0个字符
                        dp[i][j] = dp[i - 1][j] || dp[i][j - 2]
                    } else {
                        // 匹配*前0个字符
                        dp[i][j] = dp[i][j - 2]
                    }
                } else {
                    if match(i, j) {
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                    
                }
            }
        }
        return dp[sLen][pLen]
        
    }

    func match(_ i: Int, _ j: Int) -> Bool {
        if i == 0 {
            return false
        }
        if str2[j - 1] == "." {
            return true
        }
        return str1[i - 1] == str2[j - 1]  
    }
}
// @lc code=end

