//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
/*:
 ## 两数相加
 
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 ```
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let i1 = ListNode(2)
let i2 = ListNode(4)
let i3 = ListNode(3)
i1.next = i2
i2.next = i3

let j1 = ListNode(5)
let j2 = ListNode(6)
let j3 = ListNode(4)
j1.next = j2
j2.next = j3

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var result: ListNode?
    var lastNode: ListNode?
    var i = l1, j = l2
    var overflow = 0
    
    while i != nil || j != nil || overflow != 0 {
        let first = i == nil ? 0 : i!.val
        let second = j == nil ? 0 : j!.val
        let total = first + second + overflow

        let node = ListNode(total % 10)
        if lastNode != nil {
            lastNode!.next = node
            lastNode = node
        } else {
            result = node
            lastNode = node
        }
        overflow = total / 10
        
        i = i?.next
        j = j?.next
    }
    return result
}

let a = addTwoNumbers(i1, j1)

