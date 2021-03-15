/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var a = head
        var b = head
        for i in 0..<k {
            // 区间长度小于k
            if b == nil {
                return head
            }
            b = b?.next
        }
        // 反转[a, b)区间元素
        var newHead = reverseAB(a, b, k)
        // 递归完成其他区间
        a?.next = reverseKGroup(b, k)
        return newHead
    }
    // 反转区间 [a, b) 的元素，注意是左闭右开
    func reverseAB(_ a: ListNode?, _ b: ListNode?, _ k: Int) -> ListNode? {
        var cur = a
        var next = a
        var pre: ListNode? = nil
        // cur 为b时终止循环
        for i in 0..<k {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
}
// @lc code=end

