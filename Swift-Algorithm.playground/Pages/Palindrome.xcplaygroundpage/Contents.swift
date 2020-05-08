//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 
 ```
 输入: 121
 输出: true
 ```
 
 ```
 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 ```
 
 ```
 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 ```
 
 https://leetcode-cn.com/problems/palindrome-number/
 */
import Foundation

/*:
执行用时 : **84 ms** , 在所有 Swift 提交中击败了 **19.64%** 的用户
 
内存消耗 : **21.2 MB** , 在所有 Swift 提交中击败了 **100.00%** 的用户
 */
func isPalindromeOne(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }
    let origStr: String = String(x)
    let reversedStr =  String(origStr.reversed())
    
    if origStr == reversedStr {
        return true
    }
    return false
}

let a = isPalindromeOne(-12321)


func isPalindromeTwo(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }
    
    var origX = x
    var reversedX = 0
    
    while origX > 0 {
        reversedX = reversedX * 10 + origX % 10
        origX = origX / 10
    }
    
    return reversedX == x
}

let b = isPalindromeTwo(123421)
