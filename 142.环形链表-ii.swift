/*
 * @lc app=leetcode.cn id=142 lang=swift
 *
 * [142] 环形链表 II
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                break
            }
        }
        if fast == nil || fast?.next == nil {
            return nil
        }
        slow = head
        // 一次相遇时，假设慢指针 slow 走了 k 步，那么快指针 fast 一定走了 2k 步, 
        // 这多走的 k 步其实就是 fast 指针在环里转圈圈，所以 k 的值就是环长度的「整数倍
        // 设相遇点距环的起点的距离为 m，那么环的起点距头结点 head 的距离为 k - m，
        // 也就是说如果从 head 前进 k - m 步就能到达环起点。
        // 巧的是，如果从相遇点继续前进 k - m 步，也恰好到达环起点。
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        return fast
    }
}
// @lc code=end

