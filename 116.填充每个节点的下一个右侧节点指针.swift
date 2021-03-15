/*
 * @lc app=leetcode.cn id=116 lang=swift
 *
 * [116] 填充每个节点的下一个右侧节点指针
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */
// 加函数参数，一个节点做不到，我们就给他安排两个节点
// 将每一层二叉树节点连接起来」可以细化成将每两个相邻节点都连接起来
class Solution {
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        connectHelp(root?.left, root?.right)
        return root
    }

    func connectHelp(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return
        }

        left?.next = right
        // 连接相同父节点的两个子节点
        connectHelp(left?.left, left?.right)
        connectHelp(right?.left, right?.right)
        // 连接跨越父节点的两个子节点
        connectHelp(left?.right, right?.left)
        
    }

}
// @lc code=end

