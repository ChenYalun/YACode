//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=445 lang=swift
 *
 * [445] 两数相加 II
 *
 * https://leetcode-cn.com/problems/add-two-numbers-ii/description/
 *
 * algorithms
 * Medium (49.11%)
 * Total Accepted:    6.4K
 * Total Submissions: 12.7K
 * Testcase Example:  '[7,2,4,3]\n[5,6,4]'
 *
 * 给定两个非空链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储单个数字。将这两数相加会返回一个新的链表。
 *
 *
 *
 * 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 *
 * 进阶:
 *
 * 如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。
 *
 * 示例:
 *
 *
 * 输入: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 * 输出: 7 -> 8 -> 0 -> 7
 *
 *
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

// 最直观的方法
// 执行用时 :76 ms, 在所有 Swift 提交中击败了92.31%的用户
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var aNode = l1
        var bNode = l2
        // 栈保存链表中的每个元素
        var aNum = [Int]()
        var bNum = [Int]()
        while aNode != nil {
            aNum.append(aNode!.val)
            aNode = aNode?.next
        }
        while bNode != nil {
            bNum.append(bNode!.val)
            bNode = bNode?.next
        }
        
        // 计算
        var res = [Int]()
        var flag = 0
        while aNum.count > 0 || bNum.count > 0 || flag != 0 {
            let sum = (aNum.popLast() ?? 0) + (bNum.popLast() ?? 0)
            if sum + flag > 9 {
                res.append(sum + flag - 10)
                flag = 1
            } else {
                res.append(sum + flag)
                flag = 0
            }
        }
        
        // 转化为链表
        var resNode :ListNode?
        var tempNode :ListNode?
        for num in res.reversed() {
            if resNode == nil {
                resNode = ListNode(num)
                tempNode = resNode
            } else {
                tempNode?.next = ListNode(num)
                tempNode = tempNode?.next!
            }
        }
        return resNode
    }
}

let a1 = ListNode(9)
let b1 = ListNode(9)
//let c1 = ListNode(4)
//let d1 = ListNode(3)
a1.next = b1
//b1.next = c1
//c1.next = d1

let a2 = ListNode(1)
//let b2 = ListNode(6)
//let c2 = ListNode(4)
//a2.next = b2
//b2.next = c2
desc(Solution().addTwoNumbers(a1, a2))
desc(Solution().addTwoNumbers(nil, a2))
desc(Solution().addTwoNumbers(a1, nil))
desc(Solution().addTwoNumbers(nil, nil))
