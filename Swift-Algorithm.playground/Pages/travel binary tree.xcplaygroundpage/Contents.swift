//: [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)

/*:
 ## 遍历二叉树
 
 ```
 给定二叉树 [3,9,20,null,null,15,7]
     3
    / \
   9  20
     /  \
    15   7
 返回 true 。
 ```
 
 分别写出以下遍历结果：
 - 先序遍历
 - 中序遍历
 - 后序遍历
 - 层次遍历
 
 */

import Foundation

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

let left3 = TreeNode(value: 15)
let right3 = TreeNode(value: 7)
let right2 = TreeNode(value: 20, left: left3, right: right3)
let left2 = TreeNode(value: 9)
let center = TreeNode(value: 3, left: left2, right: right2)

//: 先序遍历
func preOrderTraversal(root: TreeNode) -> [Int] {
    var array = [Int]()
    func traversal(node: TreeNode?) {
        guard let node = node else { return }
        
        array.append(node.value)
        traversal(node: node.left)
        traversal(node: node.right)
    }
    traversal(node: root)
    return array
}

preOrderTraversal(root: center)

//: 中序遍历
func inOrderTraversal(root: TreeNode) -> [Int] {
    var array = [Int]()
    
    func traversal(node: TreeNode?) {
        guard let node = node else { return }
        if node.left == nil {
            array.append(node.value)
            return
        }
        traversal(node: node.left)
        array.append(node.value)
        traversal(node: node.right)
    }
    
    traversal(node: root)
    return array
}
inOrderTraversal(root: center)


//: 后序遍历
func postOrderTraversal(root: TreeNode) -> [Int] {
    var array = [Int]()
    
    func traversal(node: TreeNode?) {
        guard let node = node else { return }
        if node.right == nil {
            array.append(node.value)
            return
        }
        traversal(node: node.right)
        array.append(node.value)
        traversal(node: node.left)
    }
    
    traversal(node: root)
    return array
}
postOrderTraversal(root: center)


//: 层次遍历
func levelOrderTraversal(root: TreeNode) -> [Int] {
    var array = [Int]()
    return array
}
