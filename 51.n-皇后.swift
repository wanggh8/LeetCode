/*
 * @lc app=leetcode.cn id=51 lang=swift
 *
 * [51] N 皇后
 */

// @lc code=start
class Solution {
    var res: [[String]] = []
    var board: [[Character]] = []
    func solveNQueens(_ n: Int) -> [[String]] {
        board = Array.init(repeating: Array<Character>.init(repeating: ".", count: n), count: n)
        backtrack(0)
        return res
    }

    func backtrack(_ row: Int) {
        if row == board[0].count {
            var tmp: [String] = []
            for val in board {
                tmp.append(String.init(val))
            }
            res.append(tmp)
            return
        }
        for (col, val) in board[row].enumerated() {
            if !isValid(row: row, col: col) {
                continue
            }
            
            board[row][col] = "Q"
            backtrack(row + 1)
            board[row][col] = "."
        }
    }
    // 在 row 和 col 是否可以放置
    func isValid( row: Int, col: Int) -> Bool {
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        let diff = row - col
        let sum = row + col
        var row1 = 0
        while (row1 < row) {
            for (index, val) in board[row1].enumerated() {
                if val == "Q" && (row1 - index == diff || row1 + index == sum) {
                    return false
                }
            }
            row1 += 1
        }
      
        return true
    }
}

// @lc code=end

