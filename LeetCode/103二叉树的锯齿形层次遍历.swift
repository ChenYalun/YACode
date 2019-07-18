//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=103 lang=swift
 *
 * [103] 二叉树的锯齿形层次遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/description/
 *
 * algorithms
 * Medium (49.79%)
 * Total Accepted:    13.6K
 * Total Submissions: 27K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 *
 * 例如：
 * 给定二叉树 [3,9,20,null,null,15,7],
 *
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 *
 *
 * 返回锯齿形层次遍历如下：
 *
 * [
 * ⁠ [3],
 * ⁠ [20,9],
 * ⁠ [15,7]
 * ]
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

// 执行用时 :16 ms, 在所有 Swift 提交中击败了95.00%的用户
// 在每个层级结束的时候做文章
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var resultList = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        var order = false
        while !queue.isEmpty {
            var levelList = [Int]()
            for _ in 0..<queue.count {
                let p = queue[0]
                queue.remove(at: 0)
                levelList.append(p.val)
                if let p = p.left {queue.append(p)}
                if let p = p.right {queue.append(p)}
            }
            // 一层结束
            if order {
                levelList = levelList.reversed()
            }
            order = !order
            resultList.append(levelList)
        }
        return resultList
    }
}


// 当然也可以不使用系统的reversed函数, 每个内层选择追加或者插入到首位
/*
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var resultList = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        var order = true
        while !queue.isEmpty {
            var levelList = [Int]()
            for _ in 0..<queue.count {
                let p = queue[0]
                queue.remove(at: 0)
                if order {
                    levelList.append(p.val)
                } else {
                    levelList.insert(p.val, at: 0)
                }
                if let p = p.left {queue.append(p)}
                if let p = p.right {queue.append(p)}
            }
            // 一层结束
            order = !order
            resultList.append(levelList)
        }
        return resultList
    }
}
*/


var so = Solution()
var a = TreeNode(1)
var b = TreeNode(2)
var c = TreeNode(3)
var d = TreeNode(4)
var e = TreeNode(5)
a.left = b
a.right = c
b.left = d
c.right = e
print(so.zigzagLevelOrder(a))
