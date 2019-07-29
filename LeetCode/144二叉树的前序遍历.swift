//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
 *
 * algorithms
 * Medium (59.99%)
 * Total Accepted:    29.8K
 * Total Submissions: 49.2K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 前序 遍历。
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
 * 输出: [1,2,3]
 *
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
        // 根
        results.append(root!.val)
        // 左
        preorder(root?.left)
        // 右
        preorder(root?.right)
    }

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        preorder(root)
        return results
    }
}
 */

// 迭代解法
// 执行用时 :12 ms, 在所有 Swift 提交中击败了81.25%的用户
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var stack = [TreeNode]()
        var results = [Int]()
        var p = root
        while !stack.isEmpty || p != nil {
            while p != nil {
                stack.append(p!)
                results.append(p!.val)
                p = p!.left
            }
            p = stack.popLast()
            p = p?.right
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
print(so.preorderTraversal(node5))




