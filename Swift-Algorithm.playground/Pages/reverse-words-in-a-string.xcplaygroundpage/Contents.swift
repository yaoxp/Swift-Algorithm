//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 翻转字符串里的单词
 给定一个字符串，逐个翻转字符串中的每个单词。
 ```
 输入: "the sky is blue"
 输出: "blue is sky the"
 ```
 ```
 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。

 ```
 ```
 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 ```
 
 说明
 - 无空格字符构成一个单词。
 - 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 - 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-words-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */
import Foundation


func reverseWords(_ s: String) -> String {
    return s.split { $0.isWhitespace}.reversed().joined(separator: " ")
}

reverseWords("the sky is blue")
reverseWords("  hello world!  ")
reverseWords("a good   example")
