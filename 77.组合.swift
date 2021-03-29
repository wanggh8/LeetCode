/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 */

// @lc code=start
class Solution {

    var res = [[Int]]()
    var stack = [Int]()

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        backtrack(n, 1, k)
        return res
    }

    func backtrack(_ n: Int, _ start: Int, _ k: Int) {
        if stack.count == k {
            res.append(stack)
            return
        }

        if start > n {
            return 
        }

        for i in start...n {
            stack.append(i)
            backtrack(n, i + 1, k)
            stack.removeLast()
        }
    }
    
}
// @lc code=end

