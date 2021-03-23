/*
 * @lc app=leetcode.cn id=710 lang=swift
 *
 * [710] 黑名单中的随机数
 */

// @lc code=start

class Solution {
    // 利用哈希表巧妙处理映射关系，让数组在逻辑上是紧凑的，方便随机取元素。
    var size = 0
    var dict = [Int: Int]()
    init(_ N: Int, _ blacklist: [Int]) {
        
        size = N - blacklist.count
        for val in blacklist {
            dict[val] = N
        }
        var last = N - 1
        for val in blacklist {
            // 如果 b 已经在区间 [sz, N)
            // 可以直接忽略
            if val >= size {
                continue
            }
            // 跳过所有黑名单中的数字
            while dict[last] != nil  {
                last -= 1
            }
            dict[val] = last
            last -= 1
        }
        
    }
    
    func pick() -> Int {
        var res = Int.random(in: 0..<size)
        // 这个索引命中了黑名单，
        // 需要被映射到其他位置
        if dict[res] != nil {
            return dict[res]!
        }
        return res
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(N, blacklist)
 * let ret_1: Int = obj.pick()
 */
// @lc code=end

