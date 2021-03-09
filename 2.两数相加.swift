/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode?
        var p = head
        var p1 = l1;
        var p2 = l2;
        var (sum, add) = (0, 0)
        // 两个都有数据时
        while p1 != nil || p2 != nil {
            (sum, add) = addNum(p1, p2, add)
            if head == nil {
                head = ListNode.init(sum)
                p = head
            } else {
                p!.next = ListNode.init(sum)
                p = p!.next
            }
            if p1 != nil {
                p1 = p1!.next
            }
            if p2 != nil {
                p2 = p2!.next
            }
            
        }
        if add > 0 {
            p!.next = ListNode.init(add)
        }
        return head
    }
    // 单位加法器
    func addNum(_ p1: ListNode?, _ p2: ListNode?, _ add: Int) -> (sum: Int, add: Int) {
        var num1: Int = 0;
        var num2: Int = 0;
        if p1 != nil {
            num1 = p1!.val
        }
        if p2 != nil {
            num2 = p2!.val
        }
        var sum = num1 + num2 + add
        if (sum > 9) {
            return (sum % 10, 1)
        } else {
            return(sum, 0)
        }
    }

}
// @lc code=end

