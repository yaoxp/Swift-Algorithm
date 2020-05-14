//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 ```
 输入: "()"
 输出: true
 ```
 
 ```
 输入: "()[]{}"
 输出: true
 ```
 
 ```
 输入: "(]"
 输出: false
 ```
 
 ```
 输入: "([)]"
 输出: false
 ```
 
 ```
 输入: "{[]}"
 输出: true
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

// 使用栈
func valueForKey(_ key: String) -> Int {
    switch key {
    case "(":
        return 1
    case ")":
        return -1
    case "[":
        return 2
    case "]":
        return -2
    case "{":
        return 3
    case "}":
        return -3
    default:
        return 0
    }
}

func isValid(_ s: String) -> Bool {
    var stack = [Int]()
    for char in s {
        let value = valueForKey(String(char))
        if value > 0 {
            stack.append(value)
        } else if value < 0 {
            if stack.last != nil && stack.last! + value == 0 {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    return stack.count == 0 ? true : false
}

isValid("()")
isValid("{}[]()")
isValid("(]")
isValid("([)]")
isValid("{[]}")
isValid("][")
isValid("[")
