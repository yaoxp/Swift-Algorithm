//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)


/*:
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

 示例:
```
 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 ```
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func twoSumOne(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, value) in nums.enumerated() {
        for i in index + 1 ..< nums.count {
            if value + nums[i] == target {
                return [index, i]
            }
        }
    }
    return [0, 1]
}

let a = twoSumOne([-1, -2, -3, -4, -5], -8)


func twoSumTwo(_ nums: [Int], _ target: Int) -> [Int] {
    var dic: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        dic[value] = index
    }
    
    for (index, value) in nums.enumerated() {
        if let index2 = dic[target - value], index2 != index {
            return [index, index2]
        }
    }
    
    return [0, 1]
}

let b = twoSumTwo([-1, -2, -3, -4, -5], -8)
let c = twoSumTwo([3, 2, 4], 6)


func twoSumThree(_ nums: [Int], _ target: Int) -> [Int] {
    var dic: [Int: Int] = [:]
    
    for (index, value) in nums.enumerated() {
        if let temp = dic[target - value] {
            return [temp, index]
        }
        dic[value] = index
    }
    return []
}

let d = twoSumThree([-1, -2, -3, -4, -5], -8)
let e = twoSumThree([3, 2, 4], 6)
