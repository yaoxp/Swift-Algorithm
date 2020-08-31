//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 旋转矩阵
 给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。请你设计一种算法，将图像旋转 90 度。

 不占用额外内存空间能否做到？
 ```
 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 ```
 ```
 给定 matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 ```
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/array-and-string/clpgd/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */



import Foundation

// 先左右对折，再左上和右下对折
// 矩阵宽高相同
func rotate(_ matrix: inout [[Int]]) {
    //: 执行用时 : **16 ms** , 在所有 Swift 提交中击败了 **73.21%** 的用户
    // 左右对折
    for i in 0..<matrix.count {
        for j in 0..<(matrix[i].count / 2) {
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[i][matrix[i].count - 1 - j]
            matrix[i][matrix[i].count - 1 - j] = tmp
        }
    }
    
    // 左上和右下对折
    for i in 0..<matrix.count {
        for j in 0..<matrix.count - i {
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[matrix.count - 1 - j][matrix.count - 1 - i]
            matrix[matrix.count - 1 - j][matrix.count - 1 - i] = tmp
        }
    }
}

var tmp1 = [[1, 2, 3,], [4, 5 ,6], [7, 8, 9]]
rotate(&tmp1)
var tmp2 = [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
  ]
rotate(&tmp2)

