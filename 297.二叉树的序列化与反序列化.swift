/*
 * @lc app=leetcode.cn id=297 lang=swift
 *
 * [297] 二叉树的序列化与反序列化
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
// public class TreeNode {
//     public var val: Int
//     public var left: TreeNode?
//     public var right: TreeNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.left = nil
//         self.right = nil
//     }
// }

// 层序遍历
class Codec1 {
    let NULL = "#"
    let SEP = ","
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return ""
        }
        var q = [TreeNode?]()
        var res = ""
        q.append(root)
        while !q.isEmpty {
            var node = q.removeFirst()

            if node == nil {
                res += NULL + SEP
                continue
            }
            res = res + String(node!.val) + SEP
            q.append(node?.left)
            q.append(node?.right)
        }
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        
        if data.isEmpty {
            return nil
        }
        
        var array = data.split(separator: ",")
        print(array)
        var root = TreeNode.init(Int(array[0])!)
        var q = [TreeNode?]()
        q.append(root)
        var i = 1
        while i < array.count {
            var node = q.removeFirst()
            var left = array[i]
            if left != NULL {
                node?.left = TreeNode.init(Int(left)!)
                q.append(node?.left)
            } else {
                node?.left = nil
            }
            i += 1
            var right = array[i]
            if right != NULL {
                node?.right = TreeNode.init(Int(right)!)
                q.append(node?.right)
            } else {
                node?.right = nil
            }
            i += 1
        }
        return root
 
    }
}

// 前序遍历
class Codec2 {
    let NULL = "#"
    let SEP = ","
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return NULL + SEP
        }
        var res = String(root!.val) + SEP
        res += serialize(root?.left)
        res += serialize(root?.right)
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var array = [String]() 
        for s in data.split(separator: ",") {
            array.append(String(s))
        }
        return deserialize(array: &array)
    }

    func deserialize(array: inout [String]) -> TreeNode? {
        if array.isEmpty { 
            return nil
        }
        var first = array.removeFirst()
        if first == NULL {
            return nil
            
        } 
        var node: TreeNode? = TreeNode.init(Int(first)!)
        node?.left = deserialize(array: &array)
        node?.right = deserialize(array: &array)
        return node 
 
    }
}

// 后序遍历
class Codec {
    let NULL = "#"
    let SEP = ","
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return NULL + SEP
        }
        var res = ""
        res += serialize(root?.left)
        res += serialize(root?.right)
        res += String(root!.val) + SEP
        
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var array = [String]() 
        for s in data.split(separator: ",") {
            array.append(String(s))
        }
        return deserialize(array: &array)
    }

    func deserialize(array: inout [String]) -> TreeNode? {
        if array.isEmpty { 
            return nil
        }
        var last = array.removeLast()
        if last == NULL {
            return nil 
        } 
        var node: TreeNode? = TreeNode.init(Int(last)!)
        node?.right = deserialize(array: &array)
        node?.left = deserialize(array: &array)
        return node 
    }
}


// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
// @lc code=end

