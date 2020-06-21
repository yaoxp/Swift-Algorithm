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

protocol StackProtocol {
    mutating func push(_ item: Any)
    mutating func pop() -> Any?
    func isEmpty() -> Bool
    func top() -> Any?
}

protocol QueueProtocol {
    mutating func enqueue(_ item: Any)
    mutating func dequeue() -> Any?
    func isEmpty() -> Bool
}

struct Stack: StackProtocol {
    var array = [Any]()
    mutating func push(_ item: Any) {
        array.append(item)
    }
    mutating func pop() -> Any? {
        guard array.count > 0 else { return nil }
        return array.removeLast()
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    func top() -> Any? {
        return array.last
    }
}

struct Queue: QueueProtocol {
    var array = [Any]()
    
    mutating func enqueue(_ item: Any) {
        array.append(item)
    }
    mutating func dequeue() -> Any? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

class TreeNode<T> {
    var value: T
    var left: TreeNode<T>? = nil
    var right: TreeNode<T>? = nil
    
    init(value: T, left: TreeNode? = nil, right: TreeNode? = nil) {
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
//: 递归
func preOrderTraversal<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    func traversal(node: TreeNode<T>?) {
        guard let node = node else { return }
        
        array.append(node.value)
        traversal(node: node.left)
        traversal(node: node.right)
    }
    traversal(node: root)
    return array
}

//: 非递归
func preOrderTraversalStack<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    var stack = Stack()
    stack.push(root)
    while stack.isEmpty() == false {
        if let node = stack.pop() as? TreeNode<T> {
            array.append(node.value)
            if let rightNode = node.right {
                stack.push(rightNode)
            }
            if let leftNode = node.left {
                stack.push(leftNode)
            }
        }
    }
    return array
}

preOrderTraversal(root: center)
preOrderTraversalStack(root: center)

//: 中序遍历
//: 递归
func inOrderTraversal<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    
    func traversal(node: TreeNode<T>?) {
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

//: 栈
func inOrderTraversalStack<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    var stack = Stack()
    var node: TreeNode? = root
    while node != nil || stack.isEmpty() == false {
        if node != nil {
            stack.push(node!)
            node = node!.left
        } else {
            node = stack.pop() as? TreeNode
            array.append(node!.value)
            node = node!.right
        }
    }
    return array
}
inOrderTraversal(root: center)
inOrderTraversalStack(root: center)

//: 后序遍历 9,15,7,20,3
func postOrderTraversal<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    
    func traversal(node: TreeNode<T>?) {
        guard let node = node else { return }
        if node.left == nil && node.right == nil {
            array.append(node.value)
            return
        }
        
        traversal(node: node.left)
        traversal(node: node.right)
        array.append(node.value)
    }
    
    traversal(node: root)
    return array
}
func postOrderTraversalStack<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    var stack = Stack()
    var node: TreeNode<T>? = root
    var pre: TreeNode<T>? = nil
    while node != nil || stack.isEmpty() == false {
        while node != nil {
            stack.push(node!)
            node = node!.left
        }
        
        node = stack.top() as? TreeNode
        if node!.right == nil || pre === node!.right {
            array.append(node!.value)
            pre = node
            stack.pop()
            node = nil
        } else {
            node = node!.right
        }
    }
    
    return array
}
postOrderTraversal(root: center)
postOrderTraversalStack(root: center)

//: 层次遍历
func levelOrderTraversal<T>(root: TreeNode<T>) -> [T] {
    var array = [T]()
    
    var queue = Queue()
    queue.enqueue(root)
    var node = queue.dequeue()
    while node != nil {
        
        let treeNode = node as! TreeNode<T>
        array.append(treeNode.value)
        if treeNode.left != nil {
            queue.enqueue(treeNode.left!)
        }
        if treeNode.right != nil {
            queue.enqueue(treeNode.right!)
        }
        node = queue.dequeue()
    }
    
    return array
}
levelOrderTraversal(root: center)
