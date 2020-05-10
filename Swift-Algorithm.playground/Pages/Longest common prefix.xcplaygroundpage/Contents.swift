//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。
 
 ```
 输入: ["flower","flow","flight"]
 输出: "fl"
 ```
 
 ```
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 ```
 所有输入只包含小写字母 a-z 。
 
 
 */


import Foundation

/*:
执行用时 : **60 ms** , 在所有 Swift 提交中击败了 **25.25%** 的用户
 
内存消耗 : **20.7 MB** , 在所有 Swift 提交中击败了 **100.00%** 的用户
 */
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    } else if strs.count == 1 {
        return strs.first!
    }
    
    var result = ""
    for offset in 0..<strs[0].count {
        let char = strs[0][strs[0].index(strs[0].startIndex, offsetBy: offset)]
        for index in 1..<strs.count {
            if strs[index].count <= offset ||
                char != strs[index][strs[index].index(strs[index].startIndex, offsetBy: offset)] {
                return result
            }
        }
        result += String(char)
    }
    
    return result
}

longestCommonPrefix(["aa", "a"])
longestCommonPrefix(["c", "c"])
longestCommonPrefix(["flower","flow","flight"])
longestCommonPrefix(["dog","racecar","car"])
longestCommonPrefix(["", ""])


/*:
执行用时 : **20 ms** , 在所有 Swift 提交中击败了 **89.37%** 的用户
 
内存消耗 : **20.9 MB** , 在所有 Swift 提交中击败了 **100.00%** 的用户
 */
func longestCommonPrefixTwo(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    
    var result = strs.first!
    for index in 1..<strs.count {
        let str = strs[index]
        while str.hasPrefix(result) == false {
            result.removeLast()
            if result == "" {
                return ""
            }
        }
    }
    return result
}

longestCommonPrefixTwo(["aa", "a"])
longestCommonPrefixTwo(["c", "c"])
longestCommonPrefixTwo(["flower","flow","flight"])
longestCommonPrefixTwo(["dog","racecar","car"])
longestCommonPrefixTwo(["", ""])
