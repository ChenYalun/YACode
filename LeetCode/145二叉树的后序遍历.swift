//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 * @lc app=leetcode.cn id=145 lang=swift
 *
 * [145] 二叉树的后序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-postorder-traversal/description/
 *
 * algorithms
 * Hard (65.75%)
 * Total Accepted:    22.6K
 * Total Submissions: 33.9K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 后序 遍历。
 *
 * 示例:
 *
 * 输入: [1,null,2,3]
 * ⁠  1
 * ⁠   \
 * ⁠    2
 * ⁠   /
 * ⁠  3
 *
 * 输出: [3,2,1]
 *
 * 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 *
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


// 递归解法
/*
class Solution {
    var results = [Int]()
    func preorder(_ root: TreeNode?){
        if root == nil {
            return
        }
        // 左
        preorder(root?.left)
        // 右
        preorder(root?.right)
        // 根
        results.append(root!.val)
    }

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        preorder(root)
        return results
    }
}
*/

// 迭代解法
// 执行用时 :8 ms, 在所有 Swift 提交中击败了100.00%的用户
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var stack = [TreeNode]()
        var results = [Int]()
        var p = root
        var last: TreeNode? = nil
        while !stack.isEmpty || p != nil {
            while p != nil {
                // 持续访问左子树
                stack.append(p!)
                p = p!.left
            }
            // 获取栈顶元素
            p = stack.last
            // 访问过, 或者右子树不存在
            if p?.right == nil || p?.right?.val == last?.val {
                results.append(p!.val)
                _ = stack.popLast()
                last = p
                p = nil
            } else {
                p = p?.right
            }
        }
        return results
    }
}


let so = Solution()
let node5 = TreeNode(5)
let node3 = TreeNode(3)
let node8 = TreeNode(8)
let node1 = TreeNode(1)
let node6 = TreeNode(6)
let node9 = TreeNode(9)
node5.left = node3
node5.right = node8
node3.left = node1
node8.left = node6
node8.right = node9
print(so.postorderTraversal(node5))




