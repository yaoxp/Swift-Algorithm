//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 对角线遍历
 
 给定一个含有 M x N 个元素的矩阵（M 行，N 列），请以对角线遍历的顺序返回这个矩阵中的所有元素，对角线遍历如下图所示。
 
 ```
 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]

 输出:  [1,2,4,7,5,3,6,8,9]
 https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/diagonal_traverse.png
 ```
 */

import Foundation

 func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
//: 执行用时：**260 ms**, 在所有 Swift 提交中击败了 **100.00%** 的用户
    var result = [Int]()
    var row = 0
    var column = 0
    var direction = true // 右上为true，左下为false

    while row < matrix.count && column < matrix[0].count {
        result.append(matrix[row][column])

        if direction {
            if column + 1 >= matrix[0].count {
                // 掉转方向，变成左下
                direction = !direction
                row += 1
            } else if row - 1 < 0 {
                // 掉转方向，变成左下
                direction = !direction
                column += 1
            } else {
                row -= 1
                column += 1
            }
        } else {
            if row + 1 == matrix.count {
                direction = !direction
                column += 1
            } else if column == 0 {
                direction = !direction
                row += 1
            } else {
                row += 1
                column -= 1
            }
        }
    }
    return result
}

_ = findDiagonalOrder([
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
)


