//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 206. 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            // 只有一个结点或者最后一个结点
            return head
        }
        // 假定传进来1->2->3->4->nil, head为1, 则node为4->3->2->nil
        let node = reverseList(head?.next)
        // 使2指向1即可,1的next为2
        head?.next?.next = head
        // 使1指向nil
        head?.next = nil
        // 返回node
        return node
    }
}
*/
// 迭代法
// https://pic3.zhimg.com/v2-c434ed3a1a229820ae04b07f26896d32_b.gif
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil
        while curr != nil {
            let next = curr?.next
            // curr指向prev
            curr?.next = prev
            // prev 向前走一步
            prev = curr
            // curr 向前走一步
            curr = next
        }
        return prev
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
var node0 = ListNode(0)
var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
desc(node0)

desc(so.reverseList(node0))
