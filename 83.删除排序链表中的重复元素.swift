/*
 * @lc app=leetcode.cn id=83 lang=swift
 *
 * [83] 删除排序链表中的重复元素
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
    // 快慢指针
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var slow = head
        var fast = head
        while fast != nil {
            if fast?.val != slow?.val {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        // 断开与后面重复元素的连接
        slow?.next = nil
        return head
    }
}
// @lc code=end

