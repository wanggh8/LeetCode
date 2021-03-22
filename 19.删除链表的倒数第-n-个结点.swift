/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第 N 个结点
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        for _ in 0..<n {
            fast = fast?.next
        }
        // 如果此时快指针走到头了，
        // 说明倒数第 n 个节点就是第一个节点
        if fast == nil {
            return head?.next
        }
        // 让慢指针和快指针同步向前
        while fast != nil && fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        // slow.next 就是倒数第 n 个节点，删除它
        slow?.next = slow?.next?.next
        return head
    }
}
// @lc code=end

