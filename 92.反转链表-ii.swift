/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
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

    var unreverseStart: ListNode?

    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            // 相当于反转前 n 个元素
            return reverseN(head, right)
        }
        // 前进到反转的起点触发
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }

    // 反转以 head 为起点的 n 个节点，返回新的头结点
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            // 记录不反转的第一个节点
            unreverseStart = head?.next
            return head
        }
        // 以 head.next 为起点，需要反转前 n - 1 个节点
        var last = reverseN(head?.next, n - 1)
        // 以 head.next.next 为head.next反转后的最后一个节点
        head?.next?.next = head
        // 让反转之后的 head 节点和后面的节点连起来
        head?.next = unreverseStart
        return last
    }
}
// @lc code=end

