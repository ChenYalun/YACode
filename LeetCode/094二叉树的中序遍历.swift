//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
 *
 * algorithms
 * Medium (66.02%)
 * Total Accepted:    40.4K
 * Total Submissions: 60.9K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的中序 遍历。
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
 * 输出: [1,3,2]
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

// 方法一: 递归
// 执行用时 : 16 ms, 在所有 Swift 提交中击败了42.86%的用户
/*
class Solution {
    // 使用全局变量保存递归遍历结果
    var gResult = [Int]()
    func inorder(_ root: TreeNode?) {
        if root == nil {
            return
        }
        inorder(root!.left)
        gResult.append(root!.val)
        inorder(root!.right)
    }
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        inorder(root)
        return gResult
    }
}
 */

// 方法二: 迭代
// 执行用时 :8 ms, 在所有 Swift 提交中击败了96.83%的用户
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        // 使用栈解决
        var stack = [TreeNode]()
        var p = root
        var results = [Int]()
        while !stack.isEmpty || p != nil {
            // 持续访问左子树
            while p != nil {
                stack.append(p!)
                p = p?.left
            }
            // p = stack.popLast(), 直接使用remove更快一点
            let index = stack.count - 1
            p = stack[index]
            stack.remove(at: index)
            
            results.append(p!.val)
            p = p?.right
        }
        return results
    }
}


var so = Solution()
var a = TreeNode(3)
var b = TreeNode(2)
var c = TreeNode(8)
var d = TreeNode(5)
var e = TreeNode(9)
a.left = b
a.right = c
c.left = d
c.right = e
print(so.inorderTraversal(a))
