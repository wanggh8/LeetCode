/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
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

    var dict = [Int: Int]()

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // 方案3 使用字典存储中序遍历键值
        for (i, val) in inorder.enumerated() {
            dict[val] = i
        } 
        return buildTreeHelp2(preorder, 0, preorder.count, inorder, 0, inorder.count)
    }

    func buildTreeHelp(_ preorder: [Int], _ pStart: Int, _ pEnd: Int, _ inorder: [Int], _ iStart:Int, _ iEnd:Int) -> TreeNode? {
        if pStart == pEnd {
            return nil
        }
        
        var rootVal = preorder[pStart]
        var leftLength = 0
        var rootNode = TreeNode.init(rootVal)
        print("start:\(iStart) ,end:\(iEnd)")
        // inorder[iStart..<iEnd] 为子数组，索引inorder[iStart]为0
        for (i, val) in inorder[iStart..<iEnd].enumerated() {
            if val == rootVal {
                leftLength = i
                break
            }
        }
        rootNode.left = buildTreeHelp(preorder, pStart + 1, pStart + leftLength + 1, inorder, iStart, iStart + leftLength)
        rootNode.right = buildTreeHelp(preorder, pStart + leftLength + 1, pEnd, inorder, iStart + leftLength + 1, iEnd)
        return rootNode
    }

    func buildTreeHelp1(_ preorder: [Int], _ pStart: Int, _ pEnd: Int, _ inorder: [Int], _ iStart:Int, _ iEnd:Int) -> TreeNode? {
        if pStart == pEnd {
            return nil
        }
        
        var rootVal = preorder[pStart]
        var rootIndex = 0
        var rootNode = TreeNode.init(rootVal)
        print("start:\(iStart) ,end:\(iEnd)")
        
        for i in stride(from: iStart, to: iEnd, by: 1) {
            if rootVal == inorder[i] {
                rootIndex = i
                break
            }
        }
        var leftLength = rootIndex - iStart
        rootNode.left = buildTreeHelp1(preorder, pStart + 1, pStart + leftLength + 1, inorder, iStart, rootIndex)
        rootNode.right = buildTreeHelp1(preorder, pStart + leftLength + 1, pEnd, inorder, rootIndex + 1, iEnd)
        return rootNode
    }

    func buildTreeHelp2(_ preorder: [Int], _ pStart: Int, _ pEnd: Int, _ inorder: [Int], _ iStart:Int, _ iEnd:Int) -> TreeNode? {
        if pStart == pEnd {
            return nil
        }
        
        var rootVal = preorder[pStart]
        var rootIndexO = dict[rootVal]
        var rootNode = TreeNode.init(rootVal)
        guard let rootIndex = rootIndexO else {
            return nil
        }
        var leftLength = rootIndex - iStart
        rootNode.left = buildTreeHelp2(preorder, pStart + 1, pStart + leftLength + 1, inorder, iStart, rootIndex)
        rootNode.right = buildTreeHelp2(preorder, pStart + leftLength + 1, pEnd, inorder, rootIndex + 1, iEnd)
        return rootNode
    }
}
// @lc code=end


