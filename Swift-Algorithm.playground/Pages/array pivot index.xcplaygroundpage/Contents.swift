//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 寻找数组的中心索引
 给定一个整数类型的数组 ```nums```，请编写一个能够返回数组 “中心索引” 的方法。

 我们是这样定义数组 中心索引 的：数组中心索引的左侧所有元素相加的和等于右侧所有元素相加的和。

 如果数组不存在中心索引，那么我们应该返回 -1。如果数组有多个中心索引，那么我们应该返回最靠近左边的那一个。

 ```
 输入：
 nums = [1, 7, 3, 6, 5, 6]
 输出：3
 解释：
 索引 3 (nums[3] = 6) 的左侧数之和 (1 + 7 + 3 = 11)，与右侧数之和 (5 + 6 = 11) 相等。
 同时, 3 也是第一个符合要求的中心索引。
 ```
 
 ```
 输入：
 nums = [1, 2, 3]
 输出：-1
 解释：
 数组中不存在满足此条件的中心索引。
 ```
 
 说明：
 - nums 的长度范围为 [0, 10000]。
 - 任何一个 nums[i] 将会是一个范围在 [-1000, 1000]的整数。
 
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/array-and-string/yf47s/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import Foundation

// 只适用于nums是正数
func pivotIndex(_ nums: [Int]) -> Int {
    guard nums.count > 2 else {
        return -1
    }
    
    var left = 0
    var right = nums.count - 1
    var leftSum = nums[left]
    var rightSum = nums[right]
    while left < right {
        if right - left == 2, leftSum == rightSum {
            return left + 1
        }
        
        if leftSum < rightSum {
            left += 1
            leftSum += nums[left]
        } else {
            right -= 1
            rightSum += nums[right]
        }
    }
    
    return -1
}

func pivotIndex2(_ nums: [Int]) -> Int {
    //: 执行用时 : **196 ms** , 在所有 Swift 提交中击败了 **54.74%** 的用户
    if nums.count == 0 {
        return -1
    } else if nums.count == 1 {
        return 0
    }
    
    var pivot = 0
    let sum = nums.reduce(0, +)
    var leftSum = 0
    var rightSum = sum - leftSum - nums[pivot]
    while leftSum != rightSum && pivot < nums.count - 1 {
        leftSum += nums[pivot]
        rightSum -= nums[pivot + 1]
        pivot += 1
    }

    return leftSum == rightSum ? pivot : -1
}

func pivotIndexPerfect(_ nums: [Int]) -> Int {
    var sum = 0
    var leftSum = 0
    
    for value in nums {
        sum += value
    }
    
    for i in 0..<nums.count {
        if leftSum == sum - leftSum - nums[i] {
            return i
        }
        leftSum += nums[i]
    }
    
    return -1
}

_ = pivotIndex([1, 7, 3, 6, 5, 6])
_ = pivotIndex([1, 2, 3])
_ = pivotIndex([-1,-1,-1,-1,-1,0])

_ = pivotIndex2([1, 7, 3, 6, 5, 6])
_ = pivotIndex2([1, 2, 3])
_ = pivotIndex2([-1,-1,-1,-1,-1,0])
_ = pivotIndex2([-1,-1,-1,0,1,1]) // 0. 对这上case有异议。当pivot == 0 时，右边数是0，左边没有数为什么也是0
_ = pivotIndex2([-1,-1,0,1,1,0]) // 5. 异议同上


_ = pivotIndexPerfect([1, 7, 3, 6, 5, 6])
_ = pivotIndexPerfect([1, 2, 3])
_ = pivotIndexPerfect([-1,-1,-1,-1,-1,0])
_ = pivotIndexPerfect([-1,-1,-1,0,1,1])
_ = pivotIndexPerfect([-1,-1,0,1,1,0])
