/*
 * @lc app=leetcode.cn id=752 lang=swift
 *
 * [752] 打开转盘锁
 */

// @lc code=start
class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var q = [String]()
        var visited = Set<String>()
        var dead = Set<String>(deadends)
        q.append("0000")
        visited.insert("0000")
        var num = 0

        while !q.isEmpty {

            for i in 0..<q.count {
                var cur = q.removeFirst()

                if dead.contains(cur) {
                    continue
                }
                if cur == target {
                    return num
                }

                for t in 0..<4 {
                    var addRes = addOne(cur, t)
                    if !visited.contains(addRes) {
                        q.append(addRes)
                        visited.insert(addRes)
                    }
                    var minusRes = minusOne(cur, t)
                    if !visited.contains(minusRes) {
                        q.append(minusRes)
                        visited.insert(minusRes)
                    }

                }
                
            }
            num += 1
        }
        return -1
    }

    func addOne(_ s: String, _ i: Int) -> String {
        var cs = Array<Character>(s)

        var str = String(cs[i])
        if str == "9" {
            cs[i] = "0"
            return String(cs)
        }
        var number:UInt32 = 0
        for code in str.unicodeScalars {
            number = code.value;
        }
        number += 1
        let ch = Character(UnicodeScalar(number)!)
        cs[i] = ch
        return String(cs)

    }

    func minusOne(_ s: String, _ i: Int) -> String {
        var cs = Array<Character>(s)

        var str = String(cs[i])
        if str == "0" {
            cs[i] = "9"
            return String(cs)
        }
        var number:UInt32 = 0
        for code in str.unicodeScalars {
            number = code.value;
        }
        number -= 1
        let ch = Character(UnicodeScalar(number)!)
        cs[i] = ch
        return String(cs)
    }
}
// @lc code=end

