//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else {
        return intervals
    }

    var sortedIntervals = intervals
    sortedIntervals.sort {
        
         //: 执行用时 : **164 ms** , 在所有 Swift 提交中击败了 **24.67%** 的用户
         
        return $0.first! < $1.first!
    }

    /*
     // 用冒泡法，当数组在几千以上时，会60S超时
    var sortedIntervals = intervals
    for i in 0..<sortedIntervals.count {
        for j in 0..<sortedIntervals.count - 1 - i {
            if sortedIntervals[j].first! > sortedIntervals[j + 1].first! {
                let tmp = sortedIntervals[j]
                sortedIntervals[j] = sortedIntervals[j + 1]
                sortedIntervals[j + 1] = tmp
            }
        }
    }
 */
 
    var result = [[Int]]()
    var pre = sortedIntervals[0]

    for i in 1..<sortedIntervals.count {
        let cur = sortedIntervals[i]
        if pre.last! < cur.first! {
            result.append(pre)
            pre = cur
        } else {
            pre = [pre.first!, cur.last! > pre.last! ? cur.last! : pre.last!]
        }
    }
    
    result.append(pre)
    
    return result
}

_ = merge([[]])
_ = merge([[1,3],[2,6],[8,10],[9,18]])
_ = merge([[1,7],[2,6],[8,10],[15,18]])
_ = merge([[1,4],[4,5]])
_ = merge([[1,3],[15,18],[2,6],[8,10]])

