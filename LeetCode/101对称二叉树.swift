//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=101 lang=swift
 *
 * [101] 对称二叉树
 *
 * https://leetcode-cn.com/problems/symmetric-tree/description/
 *
 * algorithms
 * Easy (46.86%)
 * Total Accepted:    40.4K
 * Total Submissions: 85.4K
 * Testcase Example:  '[1,2,2,3,4,4,3]'
 *
 * 给定一个二叉树，检查它是否是镜像对称的。
 *
 * 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 *
 * ⁠   1
 * ⁠  / \
 * ⁠ 2   2
 * ⁠/ \ / \
 * 3  4 4  3
 *
 *
 * 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 *
 * ⁠   1
 * ⁠  / \
 * ⁠ 2   2
 * ⁠  \   \
 * ⁠  3    3
 *
 *
 * 说明:
 *
 * 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
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
// 执行用时 :28 ms, 在所有 Swift 提交中击败了69.35%的用户
/*
class Solution {
    // 判断左子树与右子树是否对称
    func isSym(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if (left == nil && right == nil) {
            return true
        } else if (left == nil || right == nil) {
            return false
        }
        // 结点相等
        let equalVal = left?.val == right?.val
        // 结点对称
        return equalVal && isSym(left?.right, right?.left) && isSym(left?.left, right?.right)
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if (root == nil) {
            // 空结点, 返回true
            return true
        }
        return isSym(root?.left, root?.right)
    }
}
*/


// 迭代解法
// 执行用时 :24 ms, 在所有 Swift 提交中击败了87.10%的用户
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            // 空树, 是对称的
            return true
        }
        
        // 使用队列解决
        var queue = [TreeNode?]()
        queue.append(root!)
        queue.append(root!)
        while !queue.isEmpty {
            let p1 = queue[0]
            queue.remove(at: 0)
            let p2 = queue[0]
            queue.remove(at: 0)
            // 左右都为空, 迭代下一次
            if p1 == nil && p2 == nil {
                continue
            }
            // 一个为空一个不为空 或者 值不等
            if p1?.val != p2?.val || (p1 == nil || p2 == nil) {
                return false
            }
            queue.append(p1?.left)
            queue.append(p2?.right)
            queue.append(p1?.right)
            queue.append(p2?.left)
        }
        return true
    }
}

var so = Solution()
var a = TreeNode(3)
var b = TreeNode(2)
var c = TreeNode(8)
var d = TreeNode(5)
var e = TreeNode(9)
a.left = b
//a.right = c
//c.left = d
//c.right = e
print(so.isSymmetric(a))
