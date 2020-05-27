//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
/*:
 ## 最大数
 给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。

 示例 1:
 ```
 输入: [10,2]
 输出: 210
 ```
 
 示例2
 ```
 输入: [3,30,34,5,9]
 输出: 9534330
 ```
 
 说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
 */
import Foundation


func largestNumber(_ nums: [Int]) -> String {
    let sort = nums.map {String($0)}.sorted {
        $0 + $1 > $1 + $0
    }
    let result = sort.joined()
    
    if result.prefix(1) == "0" {
        return "0"
    } else {
        return result
    }
}

largestNumber([0, 0])
largestNumber([10, 2])
largestNumber([3, 30, 34, 5, 9])
