//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 24. 两两交换链表中的节点
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 */
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 递归法
/*
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let a = head
        let b = head?.next
        if a == nil {
            return nil
        } else if b == nil {
            return a
        }
        // a与b交换
        a?.next = swapPairs(b?.next)
        b?.next = a
        return b
    }
}
*/

// 迭代法
/*
设置一个虚拟头结点dummyHead
设置需要交换的两个节点分别为node1 、node2，同时设置node2的下一个节点next
在这一轮操作中

将node2节点的next设置为node1节点
将node1节点的next设置为next 节点
将dummyHead 节点的next设置为node2
结束本轮操作
*/

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let tmp = ListNode(0)
        var p: ListNode? = tmp
        p?.next = head
        while p?.next != nil && p?.next?.next != nil {
            // 分别p n1 n2 next
            let n1 = p?.next
            let n2 = n1?.next
            let next = n2?.next
            
            // n2->n1 n1->next  p.next->n2 p->n1
            n2?.next = n1
            n1?.next = next
            p?.next = n2
            p = n1
        }
        return tmp.next
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

var so = Solution()
var node0 = ListNode(9)
var node1 = ListNode(4)
var node2 = ListNode(3)
var node3 = ListNode(2)
var node4 = ListNode(6)
var node5 = ListNode(4)
node0.next = node1
node1.next = node2
node2.next = node3
//node3.next = node4
//node4.next = node5
desc(so.swapPairs(node0))

