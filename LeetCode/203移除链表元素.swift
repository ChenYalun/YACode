//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=203 lang=swift
 *
 * [203] 移除链表元素
 *
 * https://leetcode-cn.com/problems/remove-linked-list-elements/description/
 *
 * algorithms
 * Easy (41.39%)
 * Total Accepted:    33.1K
 * Total Submissions: 78.7K
 * Testcase Example:  '[1,2,6,3,4,5,6]\n6'
 *
 * 删除链表中等于给定值 val 的所有节点。
 *
 * 示例:
 *
 * 输入: 1->2->6->3->4->5->6, val = 6
 * 输出: 1->2->3->4->5
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
// 执行用时 :96 ms, 在所有 Swift 提交中击败了73.33%的用户
/*
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        // 特殊处理头结点
        var head = head
        while head?.val == val {
            head = head?.next
        }
        var a = head
        while a?.next != nil {
            while a?.next?.val == val {
                a?.next = a?.next?.next
            }
            a = a?.next
        }
        return head
    }
}
*/

// 或者使用虚拟头结点
// 执行用时 :92 ms, 在所有 Swift 提交中击败了84.44%的用户
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return head
        }
        // 虚拟头结点
        let newHead = ListNode(0)
        newHead.next = head
        // 遍历指针
        var curr: ListNode? = newHead
        while curr?.next != nil {
            if curr?.next?.val == val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
            
        }
        return newHead.next
    }
}

let a1 = ListNode(1)
let a2 = ListNode(2)
let b2 = ListNode(2)
let a6 = ListNode(6)
let a3 = ListNode(3)
let a4 = ListNode(4)
let a5 = ListNode(5)
let b6 = ListNode(6)
let b1 = ListNode(1)
a1.next = a2
a2.next = b2
b2.next = a6
a6.next = a3
a3.next = a4
a4.next = a5
a5.next = b6
b6.next = b1

let so = Solution()
var de: ListNode? = so.removeElements(a1, 2)
while de != nil {
    print(de!.val)
    de = de!.next
}
