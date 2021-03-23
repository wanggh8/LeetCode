/*
 * @lc app=leetcode.cn id=316 lang=swift
 *
 * [316] 去除重复字母
 */

// @lc code=start
class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var count = [Character: Int]()
        var inStack = Set<Character>()
        var array = [Character](s)
        var stack = [Character]()
        for c in array {
            count[c, default: 0] += 1
        }
        
        for c in array {
            // 每遍历过一个字符，都将对应的计数减一
            count[c]! -= 1
            if inStack.contains(c) {
                continue
            }
            // 插入之前，和之前的元素比较一下大小
            // 如果字典序比前面的小，pop 前面的元素
            while !stack.isEmpty && c < stack.last! {
                // 若之后不存在栈顶元素了，则停止 pop
                if count[stack.last!] == 0 {
                    break
                }
                // 若之后还有，则可以 pop
                inStack.remove(stack.popLast()!)
            }
            stack.append(c)
            inStack.insert(c)
        }
        return String(stack)
    }
}
// @lc code=end

