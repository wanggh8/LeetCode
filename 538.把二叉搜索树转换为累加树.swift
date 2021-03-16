/*
 * @lc app=leetcode.cn id=538 lang=swift
 *
 * [538] 把二叉搜索树转换为累加树
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
    var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }
    func traverse(_ node: TreeNode?) {
        if node == nil {
            return
        }

        traverse(node?.right)
        sum += node!.val
        node?.val = sum
        traverse(node?.left)
        return
    }
}
// @lc code=end

