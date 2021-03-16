/*
 * @lc app=leetcode.cn id=450 lang=swift
 *
 * [450] 删除二叉搜索树中的节点
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root!.val == key {
            // 子树有一个或2个为空
            if root?.right == nil {
                return root?.left
            }
            if root?.left == nil {
                return root?.right
            }
            // 两个子树都不为空
            var min = getMin(root?.right)
            root!.val = min!.val
            root?.right = deleteNode(root?.right, min!.val)    
        } else if key > root!.val {
            root?.right = deleteNode(root?.right, key)
        } else if key < root!.val {
            root?.left = deleteNode(root?.left, key)
        }
        return root
    }
    // 获取右子树的最小节点
    func getMin(_ root: TreeNode?) -> TreeNode? {
        var node = root
        while node?.left != nil {
            node = node?.left
        }
        return node
    }
}
// @lc code=end

