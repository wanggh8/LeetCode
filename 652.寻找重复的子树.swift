/*
 * @lc app=leetcode.cn id=652 lang=swift
 *
 * [652] 寻找重复的子树
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
// 先将二叉树序列化后，在判断是否重复
class Solution {

    var dict = [String: Int]()
    var res = [TreeNode?]()

    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traverse(root)
        return res
    }

    func traverse(_ root: TreeNode?) -> String {
        if root == nil {
            return "#"
        }
        var left = traverse(root?.left)
        var right = traverse(root?.right)
        var sub = left + "," + right + ",\(root!.val)"
        var freq: Int = dict[sub] ?? 0
        if freq == 1 {
            res.append(root)
        }
        dict[sub] = freq + 1

        return sub
    }
}
// @lc code=end

