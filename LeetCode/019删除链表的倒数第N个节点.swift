//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 19. 删除链表的倒数第N个节点
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
 给定的 n 保证是有效的。
 进阶：
 你能尝试使用一趟扫描实现吗？
 */
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 一次遍历法, 使用两个指针, 一个指向头结点(位置0), 另一个指向间隔为n的结点(位置n+1), 当较快的指针指向nil, 说明遍历完毕, 此时慢指针指向被移除元素的prev结点
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 占位空结点, slow\fast\resu均指向占位空结点
        var resu: ListNode? = ListNode(0), slow = resu,head = head
        resu?.next = head
        var fast: ListNode? = resu
        for _ in 0...n {
            fast = fast?.next
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return resu?.next
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
var node3 = ListNode(9)
var node4 = ListNode(6)
var node5 = ListNode(4)
node0.next = node1
//node1.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5
desc(so.removeNthFromEnd(node0, 2))

