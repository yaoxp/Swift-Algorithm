//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 整数反转
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 ```
 输入: 123
 输出: 321
 ```
 
 ```
 输入: -123
 输出: -321
 ```
 
 ```
 输入: 120
 输出: 21
 ```
 */

import Foundation

func reverse(x: Int) -> Int {
    var lRet: Int = 0
    var tmpX = x
    
    while 0 != tmpX {
        lRet = lRet * 10 + tmpX % 10
        tmpX = tmpX / 10
    }
    
    if lRet > Int32.max || lRet < Int32.min {
        return 0
    }
    
    return lRet
}

let a = reverse(x: -18)

