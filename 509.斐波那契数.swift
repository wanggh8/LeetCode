/*
 * @lc app=leetcode.cn id=509 lang=swift
 *
 * [509] 斐波那契数
 */

// @lc code=start
class Solution {
    
    var dict = [Int: Int]()

    // 带备忘录的递归方案
    func fib1(_ n: Int) -> Int {

        if n < 2 {
            return n
        }
        
        dict[0] = 0
        dict[1] = 1 
        return fibHelper(n)
    }

    func fibHelper( _ n: Int) -> Int {
        if let res = dict[n] {
            return res
        }
        let res = fibHelper(n - 1) + fibHelper(n - 2)
        dict[n] = res
        return res
    }

    // 动态规划基础方案
    func fib2(_ n: Int) -> Int {

        if n < 2 {
            return n
        }
        
        dict[0] = 0
        dict[1] = 1 
        for i in 2...n {
            if let num1 = dict[i - 1], let num2 = dict[i - 2] {
                dict[i] = num1 + num2 
            }
        }
        return dict[n]!
    }

    // 动态规划 减少空间方案
    func fib(_ n: Int) -> Int {

        if n < 2 {
            return n
        }
        
        var pre = 0
        var cur = 1 
        for _ in 2...n {
            let sum = pre + cur
            pre = cur
            cur = sum 
        }
        return cur
    }

    
}
// @lc code=end

