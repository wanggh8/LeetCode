/*
 * @lc app=leetcode.cn id=875 lang=swift
 *
 * [875] 爱吃香蕉的珂珂
 */

// @lc code=start
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = getMax(piles) + 1
        while left < right {
            var mid = left + (right - left) / 2
            if finish(piles, speed: mid, h: h) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func getMax(_ piles: [Int]) -> Int {
        var max = 0
        for val in piles {
            if max < val {
                max = val
            }
        }
        return max
    }
    func finish(_ piles: [Int], speed: Int, h: Int) -> Bool {
        var sum = 0
        for val in piles {
            sum += val / speed + ((val % speed == 0) ? 0 : 1)
        }
        return sum <= h
    }
    
}
// @lc code=end

