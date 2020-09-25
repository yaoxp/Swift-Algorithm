//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 最长回文字符串
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 ```
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 ```
 ```
 输入: "cbbd"
 输出: "bb"
 ```
 https://leetcode-cn.com/leetbook/read/array-and-string/conm7/
 */

import Foundation

func isPalindrome(array: [String.Element], left: Int, right: Int) -> Bool {
    var tmpLeft = left, tmpRight = right
    while tmpLeft < tmpRight {
        if array[tmpLeft] != array[tmpRight] {
            return false
        }
        tmpLeft += 1
        tmpRight -= 1
    }
    return true
}

// MARK: - 暴力法
//: 执行用时：**3364 ms**, 在所有 Swift 提交中击败了**8.08%**的用户
func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    var maxLen = 1
    var begin = 0
    let charArray = Array(s)
    for i in 0..<charArray.count - 1 {
        for j in i+1..<charArray.count {
            if maxLen < j - i + 1 && isPalindrome(array: charArray, left: i, right: j) {
                maxLen = j - i + 1
                begin = i
            }
        }
    }
    return substring(s, from: begin, offset: maxLen)
}

func substring(_ str: String, from index: Int, offset: Int) -> String {
    guard offset > 0 else {
        return ""
    }
    let startIndex = str.index(str.startIndex, offsetBy: index)
    let endIndex = str.index(str.startIndex, offsetBy: index + offset - 1)
    return String(str[startIndex...endIndex])
}

let str = "abcdefg"
let substr = substring(str, from: 2, offset: 3)
let substr1 = substring(str, from: 2, offset: 1)
let substr2 = substring(str, from: 2, offset: 0)
_ = longestPalindrome("babad")
_ = longestPalindrome("cbbd")
_ = longestPalindrome("ac")


// MARK: - 动态规划法.暴力法的优化
//: 执行用时：**1484 ms**, 在所有 Swift 提交中击败了**22.46%**的用户
func longestPalindrome2(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        for index in 0..<s.count {
            dp[index][index] = true
        }
        let array = Array(s)
        var maxLen = 1
        var begin = 0
        
        for j in 1..<s.count {
            for i in 0..<j {
                if array[i] != array[j] {
                    dp[i][j] = false
                } else {
                    if j - i < 3 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i + 1][j - 1]
                    }
                }
                
                if dp[i][j] && j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    begin = i
                }
            }
        }
        
        return substring(s, from: begin, offset: maxLen)
}

_ = longestPalindrome2("babad")
_ = longestPalindrome2("cbbd")
_ = longestPalindrome2("ac")
