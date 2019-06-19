//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 82. 删除排序链表中的重复元素 II
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
 
 示例 1:
 
 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:
 
 输入: 1->1->1->2->3
 输出: 2->3

 */
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func desc(_ node: ListNode?) {
    var str = ""
    var node = node
    while node != nil {
        str += "\(node!.val)"
        node = node!.next
        if node != nil {
            str += ","
        }
    }
    print(str)
}


// 快慢指针
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var fast = head
        var head = head
        // 占位结点
        var slow: ListNode? = ListNode(0)
        var slowHasMoved = false
        slow?.next = fast
        while fast != nil {
            if fast?.val == fast?.next?.val {
                var p = fast?.next?.next
                while p != nil && p?.val == fast?.val {
                    p = p?.next
                }
                if !slowHasMoved { // 没有移动过
                    slow?.next = p
                    head = p
                } else {
                    slowHasMoved = true
                    slow?.next = p
                }
                fast = slow?.next
            } else {
                fast = fast?.next
                slow = slow?.next
                slowHasMoved = true
            }
        }
        return head
    }
}

var so = Solution()
var node0 = ListNode(5)
var node1 = ListNode(5)
var node2 = ListNode(5)
var node3 = ListNode(5)
var node4 = ListNode(5)
var node5 = ListNode(5)
var node6 = ListNode(5)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
desc(so.deleteDuplicates(node0))





