/*
 * @lc app=leetcode.cn id=124 lang=swift
 *
 * [124] 二叉树中的最大路径和
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
    var res = Int.min;
    func maxPathSum(_ root: TreeNode?) -> Int {
        getOneMax(root)
        return res
    }
    // 后续遍历
    func getOneMax(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        // 子节点和为负数时取0
        var left = max(0, getOneMax(root.left))
        var right = max(0, getOneMax(root.right))
        res = max(left + right + root.val, res)
        return max(left + root.val, right + root.val)
    }
}
// @lc code=end

