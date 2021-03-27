/*
 * @lc app=leetcode.cn id=45 lang=swift
 *
 * [45] 跳跃游戏 II
 */

// @lc code=start
class Solution1 {
    // 贪心算法
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        var farthestIndex = 0
        var end = 0
        var jumps = 0
        for i in 0..<n-1 {
            farthestIndex = max(farthestIndex, i + nums[i]) 
            if end == i {
                jumps += 1
                end = farthestIndex
            }
            
        }
        return jumps
    }
}

class Solution {
    var meo = [Int]()
    // 动态规划
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        meo = [Int](repeating: n, count: n)
        return dp(nums, 0)
    }

    func dp(_ nums: [Int], _ p: Int) -> Int {
        let n = nums.count
        
        if p >= n - 1 {
            return 0
        }
        if meo[p] != n {
            return meo[p]
        }
        let steps = nums[p]
        // 不可到达
        if steps == 0 {
            return meo[p]
        }

        for i in 1...steps {
            let sub = dp(nums, p + i)
            meo[p] = min(meo[p], sub + 1)
        }
        print(meo)
        
        return meo[p]
    }
} 
// @lc code=end

