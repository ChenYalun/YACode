//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层次遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (56.60%)
 * Total Accepted:    32.8K
 * Total Submissions: 57.3K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 *
 * 例如:
 * 给定二叉树: [3,9,20,null,null,15,7],
 *
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 *
 *
 * 返回其层次遍历结果：
 *
 * [
 * ⁠ [3],
 * ⁠ [9,20],
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

// 执行用时 :36 ms, 在所有 Swift 提交中击败了36.07%的用户
// 递归解法
/*
class Solution {
    var levels = [[Int]]()
    func levelCall(_ root: TreeNode, _ level: Int)  {
        if levels.count == level {
            levels.append([Int]())
        }
        levels[level].append(root.val)
        if let left = root.left {
            levelCall(left, level + 1)
        }
        if let right = root.right {
            levelCall(right, level + 1)
        }
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        levelCall(root!, 0)
        return levels
    }
}
*/


// 执行用时 :20 ms, 在所有 Swift 提交中击败了100.00%的用户
// 考虑使用队列
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
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
        return resultList
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
b.right = e
print(so.levelOrder(a))
