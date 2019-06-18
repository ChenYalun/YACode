//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 141. 环形链表
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 示例 1：
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // 快慢指针法
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while fast != nil && fast?.next != nil {
            // slow每次走一步
            slow = slow?.next
            // fast每次走两步(多走容易错过, 出现多跑一圈的情况)
            fast = fast?.next?.next
            if fast?.val == slow?.val {
                return true
            }
        }
        return false
    }
}


var so = Solution()
var node0 = ListNode(0)
var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2
print(so.hasCycle(node0))
