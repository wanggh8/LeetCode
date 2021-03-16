/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return help(root, max: nil, min: nil)
    }

    func help(_ root: TreeNode?, max: TreeNode?, min: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if (min != nil && root!.val <= min!.val) {
            return false
        }
        if (max != nil && root!.val >= max!.val) {
            return false
        }
        return help(root?.right, max: max, min: root) && help(root?.left, max: root, min: min)
    }
}
// @lc code=end

