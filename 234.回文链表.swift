/*
 * @lc app=leetcode.cn id=234 lang=swift
 *
 * [234] 回文链表
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

// 使用递归 栈
// 时间：0(n) 空间：0(n)
class Solution1 {
    var left: ListNode?
    func isPalindrome(_ head: ListNode?) -> Bool {
        left = head
        return traverse(head)
    }
    func traverse(_ right: ListNode?) -> Bool {
        if right == nil {
            return true
        }
        var res = traverse(right?.next)
        res == res && left?.val == right?.val 
        left = left?.next                                 
        return res
    }
}

// 使用快慢指针找到中间节点后 反转后半段链表 
// 时间：0(n) 空间：0(1)
class Solution {
    var left: ListNode?
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 使用快慢指针找到中间节点
        var fast = head
        var slow = head
        while fast?.next != nil && slow?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        // 如果fast不为nil，slow在最中间节点，不需要反转
        if (fast != nil) {
            slow = slow?.next
        }
        // 反转中间节点后的链表
        var (right, n) = reverse(slow)
        var left = head
        while right != nil {
            if left?.val != right?.val {
                print(left?.val)
                print(right?.val)
                return false
            }
            left = left?.next
            right = right?.next    
        }
    
        return true
    }

    func reverse(_ head: ListNode?) -> (ListNode?, Int){
        var cur = head
        var next = cur
        var pre: ListNode? = nil
        var n = 0
        while cur != nil {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
            n += 1
        }
        return (pre, n)
    }
    
}
// @lc code=end

