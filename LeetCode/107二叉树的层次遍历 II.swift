//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=107 lang=swift
 *
 * [107] 二叉树的层次遍历 II
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/description/
 *
 * algorithms
 * Easy (60.82%)
 * Total Accepted:    19.4K
 * Total Submissions: 31.6K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 *
 * 例如：
 * 给定二叉树 [3,9,20,null,null,15,7],
 *
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 *
 *
 * 返回其自底向上的层次遍历为：
 *
 * [
 * ⁠ [15,7],
 * ⁠ [9,20],
 * ⁠ [3]
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


// 可以每次直接insert到首个位置
// 执行用时 :28 ms, 在所有 Swift 提交中击败了58.06%的用户
/*
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var resultList = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            var levelList = [Int]()
            for _ in 0..<queue.count {
                let p = queue[0]
                queue.remove(at: 0)
                levelList.append(p.val)
                if let left = p.left {
                    queue.append(left)
                }
                if let right = p.right {
                    queue.append(right)
                }
            }
            // 一层结束
            resultList.insert(levelList, at: 0)
        }
        return resultList
    }
}
*/

// 也可以最后调用reversed()函数
// 执行用时 :24 ms, 在所有 Swift 提交中击败了83.87%的用户
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var resultList = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            var levelList = [Int]()
            for _ in 0..<queue.count {
                let p = queue[0]
                queue.remove(at: 0)
                levelList.append(p.val)
                if let left = p.left {
                    queue.append(left)
                }
                if let right = p.right {
                    queue.append(right)
                }
            }
            // 一层结束
            resultList.append(levelList)
        }
        return resultList.reversed()
    }
}


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
print(so.levelOrderBottom(a))
