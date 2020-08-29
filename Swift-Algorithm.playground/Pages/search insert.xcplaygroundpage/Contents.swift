//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 搜索插入位置
 
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 你可以假设数组中无重复元素。
 
 ```
 输入: [1,3,5,6], 5
 输出: 2
 ```
 
 ```
 输入: [1,3,5,6], 2
 输出: 1
 ```
 
 ```
 输入: [1,3,5,6], 7
 输出: 4
 ```
 
 ```
 输入: [1,3,5,6], 0
 输出: 0
 ```
 
 https://leetcode-cn.com/leetbook/read/array-and-string/cxqdh/
 */

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    //: 执行用时 : **40 ms** , 在所有 Swift 提交中击败了 **78.54%** 的用户
    for (index, value) in nums.enumerated() {
        if value >= target {
            return index
        }
    }
    return nums.count
}

_ = searchInsert([1, 3, 5, 6], 2)
_ = searchInsert([1, 3, 5, 6], 7)
_ = searchInsert([1, 3, 5, 6], 0)

