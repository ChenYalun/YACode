//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=199 lang=swift
 *
 * [199] 二叉树的右视图
 *
 * https://leetcode-cn.com/problems/binary-tree-right-side-view/description/
 *
 * algorithms
 * Medium (58.95%)
 * Total Accepted:    7.6K
 * Total Submissions: 12.6K
 * Testcase Example:  '[1,2,3,null,5,null,4]'
 *
 * 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 *
 * 示例:
 *
 * 输入: [1,2,3,null,5,null,4]
 * 输出: [1, 3, 4]
 * 解释:
 *
 * ⁠  1            <---
 * ⁠/   \
 * 2     3         <---
 * ⁠\     \
 * ⁠ 5     4       <---
 *
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

// 实际上就是层序遍历时, 最后一个结点
// 执行用时 :12 ms, 在所有 Swift 提交中击败了100.00%的用户
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue = [TreeNode]()
        var result = [Int]()
        queue.append(root!)
        while !queue.isEmpty {
            // 一层遍历结束
            result.append(queue.last!.val)
            for _ in 0..<queue.count { // 使用一个循环来确定一层遍历结束
                let node = queue.remove(at: 0)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        return result
    }
}


let a1 = TreeNode(1)
let a2 = TreeNode(2)
let a3 = TreeNode(3)
let a4 = TreeNode(4)
let a5 = TreeNode(5)
let a6 = TreeNode(6)
let a7 = TreeNode(7)
let a8 = TreeNode(8)
let a9 = TreeNode(9)
a1.left = a2
a1.right = a3
a2.right = a5
a3.right = a4
a5.left = a6
a5.right = a7
a6.left = a8
a6.right = a9
let so = Solution()
print(so.rightSideView(a1))

