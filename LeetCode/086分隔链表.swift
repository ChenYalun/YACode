//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
 *
 * https://leetcode-cn.com/problems/partition-list/description/
 *
 * algorithms
 * Medium (49.93%)
 * Total Accepted:    10.4K
 * Total Submissions: 20.7K
 * Testcase Example:  '[1,4,3,2,5,2]\n3'
 *
 * 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 *
 * 你应当保留两个分区中每个节点的初始相对位置。
 *
 * 示例:
 *
 * 输入: head = 1->4->3->2->5->2, x = 3
 * 输出: 1->2->2->4->3->5
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

// 执行用时 :20 ms, 在所有 Swift 提交中击败了100.00%的用户
// 可以维护两个链表, 最后合并在一块
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var p = head
        var a: ListNode? = nil
        var b: ListNode? = nil
        var left: ListNode? = nil
        var right: ListNode? = nil
        while p != nil {
            // 持有原先的结点
            let origin = p
            p = p?.next
            // 把origin结点单独拿出来
            origin?.next = nil
            
            if origin!.val < x {
                if left == nil {
                    left = origin
                    a = left
                } else {
                    left?.next = origin
                    left = left?.next
                }
            } else {
                if right == nil {
                    right = origin
                    b = right
                } else {
                    right?.next = origin
                    right = right?.next
                }
            }
        }
        
        if left == nil {
            // 考虑只有右半部分的情况
            return b
        } else {
            left?.next = b
            return a
        }
    }
}



var head = ListNode(1)
var a = ListNode(4)
var b = ListNode(3)
var c = ListNode(2)
var d = ListNode(5)
var e = ListNode(2)
head.next = a
a.next = b
b.next = c
c.next = d
d.next = e
desc(Solution().partition(head, 3))







