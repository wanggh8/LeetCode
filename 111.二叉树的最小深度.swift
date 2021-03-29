/*
 * @lc app=leetcode.cn id=111 lang=swift
 *
 * [111] 二叉树的最小深度
 */

// @lc code=start


// public class TreeNode {
//     public var val: Int
//     public var left: TreeNode?
//     public var right: TreeNode?
//     public init() { self.val = 0; self.left = nil; self.right = nil; }
//     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//         self.val = val
//         self.left = left
//         self.right = right
//     }
    
// }
 
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        var q = [TreeNode]()
        var depth = 1
        if root == nil {
            return 0
        }
        q.append(root!)
        while !q.isEmpty {
            let n = q.count
            for i in 0..<n {
                var cur = q.removeFirst()
                if cur.left == nil && cur.right == nil {
                    return depth
                }
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

