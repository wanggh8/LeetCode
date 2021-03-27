
func spack(weight: Int, num: Int, weights: [Int], val: [Int]) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: weight + 1), count: num + 1)
    // i 为当前物品 
    // j 为当前重量
    for i in 1...num {
        for j in 1...weight {
            if j < weights[i - 1] {
                // 背包无法装下
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weights[i - 1]] + val[i - 1])
            }
        }
    }
    
    return dp[num][weight]
}

print(spack(weight: 4, num: 3, weights: [2, 1, 3], val: [4, 2, 3]))