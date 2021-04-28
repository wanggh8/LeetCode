/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

// @lc code=start

// O(m+n)
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let l1 = nums1.count
        let l2 = nums2.count
        let mid = (l1 + l2) / 2 + 1
        let twoMid = (l1 + l2) % 2 == 0 ? false : true
        var index1 = 0
        var index2 = 0
        var num = 0
        var pre = 0
        var cur = 0
        while index1 < l1 && index2 < l2 {  
            if nums1[index1] < nums2[index2] {
                pre = cur
                cur = nums1[index1]
                index1 += 1
            } else {
                pre = cur
                cur = nums2[index2]
                index2 += 1 
            }
            num += 1
            if num != mid {
                continue
            }
            if twoMid {
                return Double(cur)
            } else {
                return Double(cur + pre) / 2
            }
        }
        while index1 < l1 {
            pre = cur
            cur = nums1[index1]
            index1 += 1
            num += 1
            if num != mid {
                continue
            }
            if twoMid {
                return Double(cur)
            } else {
                return Double(cur + pre) / 2
            }
        }

        while index2 < l2 {
            pre = cur
            cur = nums2[index2]
            index2 += 1
            num += 1
            if num != mid {
                continue
            }
            if twoMid {
                return Double(cur)
            } else {
                return Double(cur + pre) / 2
            }
        }
        return -1
    }
}
// @lc code=end

