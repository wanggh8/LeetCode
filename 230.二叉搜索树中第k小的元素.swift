/*
 * @lc app=leetcode.cn id=230 lang=swift
 *
 * [230] 二叉搜索树中第K小的元素
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
    var res: Int = 0 
    var rank = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root, k)
        return res
    }
    func traverse(_ node: TreeNode?, _ k: Int) {
        if node == nil {
            return
        }
        traverse(node?.left, k)
        rank += 1
        if (rank == k) {
            res = node?.val ?? 0
        }
        traverse(node?.right, k)
    }
}
// @lc code=end

