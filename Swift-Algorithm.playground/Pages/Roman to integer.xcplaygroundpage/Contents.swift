//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
 ```
 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 ```
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 - I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 - X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 - C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

 ```
 输入: "III"
 输出: 3
 ```
 
 ```
 输入: "IV"
 输出: 4
 ```
 
 ```
 输入: "IX"
 输出: 9
 ```
 
 ```
 输入: "LVIII"
 输出: 58
 解释: L = 50, V= 5, III = 3.
 ```
 
 ```
 输入: "MCMXCIV"
 输出: 1994
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/roman-to-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

/*:
执行用时 : **60 ms** , 在所有 Swift 提交中击败了 **27.19%** 的用户
 
内存消耗 : **21.2 MB** , 在所有 Swift 提交中击败了 **100.00%** 的用户
 */
func romanToInt(_ s: String) -> Int {
    let map = ["I": 1, "V": 5, "X": 10, "L": 50,
               "C": 100, "D": 500, "M": 1000]
    let arrayS = s.map { String($0) }
    var total: Int = 0
    
    for (index, value) in arrayS.enumerated() {
        if index < arrayS.count - 1 {
            if map[value]! < map[arrayS[index + 1]]! {
                total -= map[value]!
            } else {
                total += map[value]!
            }
        } else {
            total += map[value]!
        }
    }
    return total
}

romanToInt("III")
romanToInt("IV")
romanToInt("IX")
romanToInt("LVIII")
romanToInt("MCMXCIV")


/*:
执行用时 : **36 ms** , 在所有 Swift 提交中击败了 **85.53%** 的用户
 
内存消耗 : **20.9 MB** , 在所有 Swift 提交中击败了 **100.00%** 的用户
 */
func romanToIntTwo(_ s: String) -> Int {
    guard s.count > 1 else {
        return getRomanValue(s[s.startIndex])
    }
    
    var currentChar = s[s.startIndex]
    var sum = 0
    for i in 1..<s.count {
        let nextChar = s[s.index(s.startIndex, offsetBy: i)]
        let currentValue = getRomanValue(currentChar)
        let nextValue = getRomanValue(nextChar)
        if currentValue < nextValue {
            sum -= currentValue
        } else {
            sum += currentValue
        }
        currentChar = nextChar
    }
    
    sum += getRomanValue(s[s.index(before: s.endIndex)])
    
    return sum
}

func getRomanValue(_ value: Character) -> Int {
    switch value {
    case "I":
        return 1
    case "V":
        return 5
    case "X":
        return 10
    case "L":
        return 50
    case "C":
        return 100
    case "D":
        return 500
    case "M":
        return 1000
    default:
        return 0
    }
}

romanToIntTwo("III")
romanToIntTwo("IV")
romanToIntTwo("IX")
romanToIntTwo("LVIII")
romanToIntTwo("MCMXCIV")
