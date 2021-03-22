/*
 * @lc app=leetcode.cn id=1011 lang=swift
 *
 * [1011] 在 D 天内送达包裹的能力
 */

// @lc code=start
class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var left = getMin(weights)
        var right = getSum(weights) + 1
        var mid = 0
        while left < right {
            mid = left + (right - left) / 2
            if finish(weights, mid, D) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func getMin(_ weights: [Int]) -> Int {
        var min = 0
        for val in weights {
            if val < min {
                min = val
            }
        }
        return min
    }
    func getSum(_ weights: [Int]) -> Int {
        var sum = 0
        for val in weights {
            sum += val
        }
        return sum
    }

    func finish(_ weights: [Int], _ weight: Int, _ d: Int) -> Bool {
        var index = 0
        var max = weight
        for day in 0..<d {
            max = weight
            while max - weights[index] >= 0 {
                max -= weights[index]
                index += 1
                if index == weights.count {
                    return true
                }
            }

        }
        return false
    }
}
// @lc code=end

