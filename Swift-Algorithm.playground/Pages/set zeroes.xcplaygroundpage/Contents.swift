//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 零矩阵
 编写一种算法，若M × N矩阵中某个元素为0，则将其所在的行与列清零。
 
 ```
 输入：
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 输出：
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 ```
 ```
 输入：
 [
   [0,1,2,0],
   [3,4,5,2],
   [1,3,1,5]
 ]
 输出：
 [
   [0,0,0,0],
   [0,4,5,0],
   [0,3,1,0]
 ]
```
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/array-and-string/ciekh/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
//: 执行用时： **144 ms**, 在所有 Swift 提交中击败了**100.00%**的用户
    var indexs = [[Int]]()

    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == 0 {
                indexs.append([i, j])
            }
        }
    }
    
    for index in 0..<indexs.count {
        let point = indexs[index]
        for j in 0..<matrix[0].count {
            matrix[point[0]][j] = 0
        }
        for i in 0..<matrix.count {
            matrix[i][point[1]] = 0
        }
    }

}

var a = [
  [1,1,1],
  [1,0,1],
  [1,1,1]
]
setZeroes(&a)

var b = [
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]
setZeroes(&b)

