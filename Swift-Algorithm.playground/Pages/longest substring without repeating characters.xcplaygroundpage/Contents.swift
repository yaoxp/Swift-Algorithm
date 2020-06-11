//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
/*:
 ## 无重复字符的最长子串
 
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 ```
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 ```
 
 ```
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 ```
 
 ```
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 ```
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation


func lengthOfLongestSubstring(_ s: String) -> Int {
    //: 执行用时 : **4504 ms** , 在所有 Swift 提交中击败了 **5.06%** 的用户
    guard s.count > 0 else { return 0 }
    var i = 0, j = 0
    var max = 1
    let array = s.map { String($0) }
    
    func containNextValue(_ array: [String], startIndex: Int, endIndex: Int) -> Bool {
        guard startIndex < array.count - 1 &&
            endIndex < array.count - 1 else {
                return false
        }
        
        for index in startIndex...endIndex {
            if array[index] == array[endIndex + 1] {
                return true
            }
        }
        return false
    }
    
    while i < array.count - 1 && j < array.count - 1 {
        if containNextValue(array, startIndex: i, endIndex: j) {
            i += 1
            j = i
        } else {
            j += 1
            let tmp = j - i + 1
            max = max > tmp ? max : tmp
        }
    }
    
    return max
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")


func lengthOfLongestSubstring2(_ s: String) -> Int {
    //: 执行用时 : **40 ms** , 在所有 Swift 提交中击败了 **86.77%** 的用户
        guard s.count > 0 else { return 0 }
        
        let array = Array(s)
        var cache = [Character: Int]()
        var left = 0, result = 1
        for right in 0..<array.count {
            let char = array[right]
            if let index = cache[char], index >= left {
                left = index + 1
            }
            cache[char] = right
            result = max(result, right - left + 1)
        }
        return result
}

lengthOfLongestSubstring2("abcabcbb")
lengthOfLongestSubstring2("bbbbb")
lengthOfLongestSubstring2("pwwkew")


func sum(num: Int) -> Int {
    guard num > 0 else { return 0 }
    
    return num + sum(num: num - 1)
}

func sum2(num: Int) -> Int {
    let a = Double(1 + num) / 2.0
    return Int(a * Double(num))
}

sum(num: 100)
sum2(num: 100)

sum(num: 39)
sum2(num: 39)

sum(num: 321)
sum2(num: 321)

sum(num: 1000)
sum2(num: 1000)
