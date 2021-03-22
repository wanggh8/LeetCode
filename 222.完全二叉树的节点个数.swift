/*
 * @lc app=leetcode.cn id=222 lang=swift
 *
 * [222] 完全二叉树的节点个数
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
import Foundation

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        var leftH = 0
        var rightH = 0
        var left = root
        var right = root
        while left != nil {
            left = left?.left
            leftH += 1
        }
        while right != nil {
            right = right?.right 
            rightH += 1
        }
        if leftH == rightH {
            // decimal to int
            return NSDecimalNumber(decimal: pow(2.0, leftH)).intValue - 1
        }
        return 1 + countNodes(root?.left) + countNodes(root?.right)

    }
}
// @lc code=end

