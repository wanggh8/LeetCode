/*
 * @lc app=leetcode.cn id=104 lang=swift
 *
 * [104] 二叉树的最大深度
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

// DFS
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        
        return dfs(root)
    }

    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        return max(dfs(node!.left), dfs(node!.right)) + 1

    }
}

// BFS
class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        var q = [TreeNode]()
        var depth = 0
        if root == nil {
            return 0
        }
        q.append(root!)
        while !q.isEmpty {
            var n = q.count
            for i in 0..<n {
                var cur = q.removeFirst()
                if cur.left != nil {
                    q.append(cur.left!)
                }
                if cur.right != nil {
                    q.append(cur.right!)
                }
            }
            depth += 1
        }
        return depth
    }
}
// @lc code=end

