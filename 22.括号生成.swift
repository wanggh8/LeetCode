/*
 * @lc app=leetcode.cn id=22 lang=swift
 *
 * [22] 括号生成
 */

// @lc code=start
class Solution {

    var res = [String]()
    var stack = [Character]()
    func generateParenthesis(_ n: Int) -> [String] {
        backtrack(n, n)
        return res
    }

    func backtrack(_ left: Int, _ right: Int) {
        if left < 0 || right < 0 {
            return 
        } 
        // 若左括号剩下的多，说明不合法
        if left > right {
            return
        }
        // // 当所有括号都恰好用完时，得到一个合法的括号组合
        if left == 0 && right == 0 {
            res.append(String(stack))
            return 
        }
        
        stack.append("(")
        backtrack(left - 1, right)
        stack.removeLast()

        stack.append(")")
        backtrack(left, right - 1)
        stack.removeLast()

    }
}
// @lc code=end

