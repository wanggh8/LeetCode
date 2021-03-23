/*
 * @lc app=leetcode.cn id=380 lang=swift
 *
 * [380] 常数时间插入、删除和获取随机元素
 */

// @lc code=start

class RandomizedSet {

    var nums = [Int]()
    var index = [Int: Int]()

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if index[val] != nil {
            return false
        }
        index[val] = nums.count
        nums.append(val)
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let i = index[val] {
            let tmp = nums[nums.count - 1]
            index[tmp] = i
            nums[i] = tmp
            index[val] = nil
            nums.removeLast()
            return true
        } else {
            return false
        }
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return nums[Int.random(in: 0..<nums.count)]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
// @lc code=end

