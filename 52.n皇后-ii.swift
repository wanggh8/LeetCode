/*
 * @lc app=leetcode.cn id=52 lang=swift
 *
 * [52] N皇后 II
 */

// @lc code=start

class Solution {
    var res = 0
    var board = [[Character]]()

    func totalNQueens(_ n: Int) -> Int {
        board = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)
        backtrack(row: 0)
        return res
    }

    func backtrack(row: Int) {
        let n = board[0].count
        if row == n {
            res += 1
            return
        }

        for col in 0..<n {
            if !isVaild(row, col) {
                continue
            }
            board[row][col] = "Q"
            backtrack(row: row + 1)
            board[row][col] = "."
        }
    }

    func isVaild(_ row: Int, _ col: Int) -> Bool {
        let n = board[0].count
        for i in 0..<n {
            if board[i][col] == "Q" {
                return false
            } 
            if board[row][i] == "Q" {
                return false
            }
        }

        for i in 0..<n {
            for j in 0..<n {
                if i + j == row + col && board[i][j] == "Q" {
                    return false
                }
                if i - j == row - col && board[i][j] == "Q" {
                    return false
                } 
            }
        }
        return true
    }
}
// @lc code=end

