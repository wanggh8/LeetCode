/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 */

// @lc code=start
class Solution {

    // 带备忘录的递归方案
    func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
        var dict = [Int: Int]()

        func help(_ n: Int) -> Int {

            if n < 0 {
                return -1
            }

            if n == 0 {
                return 0
            }

            if let res = dict[n] {
                return res
            }
            
            var res = Int.max
            
            for i in coins {
                let subRes = help(n - i)
                if subRes == -1 {
                    continue
                }
                res = min(res, 1 + subRes)
            }
            res = (res == Int.max) ? -1 : res
            dict[n] = res
            return res
        }

        return help(amount)

    }

    // 动态规划
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        // 特殊情况
        if amount == 0 { 
            return 0
        }    
        // 设置数组，初值比超出值的范围
        var array = Array(repeating: amount + 1, count: amount + 1)
        // base case
        array[0] = 0
        // 外层 for 循环在遍历所有状态的所有取值
        for i in 1...amount {
            // 内层 for 循环在求所有选择的最小值
            for coin in coins {
                // 子问题无解，跳过
                if (coin > i) {
                    continue
                }
                array[i] = min(array[i], array[i - coin] + 1)
            }
        }
        return array[amount] == amount + 1 ? -1 : array[amount]

    }

    
}
// @lc code=end

