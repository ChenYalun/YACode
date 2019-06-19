//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 2. 两数相加
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 */
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/*
 // 很low的一种写法....
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l1
        }
        if l2 == nil {
            return l1
        }
        
        var a = l1
        var b = l2
        let num = a!.val + b!.val
        var p: ListNode? = ListNode(num)
        let re = p
        while a?.next != nil || b?.next != nil {
            a = a?.next
            b = b?.next
            p?.next = ListNode((a?.val ?? 0) + (b?.val ?? 0))
            p = p?.next!
        }
        p = re
        while p != nil {
            if p!.val >= 10 {
                p!.val -= 10
                if p!.next == nil {
                    p!.next = ListNode(1)
                } else {
                    p!.next?.val += 1
                }
                
            }
            p = p!.next
        }
        return re
    }
}
*/


// 整理后的代码
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 设置占位首结点, 便于遍历
        var curr: ListNode? = ListNode(0)
        var l1 = l1, l2 = l2, resu = curr
        // 记录上次的进位
        var carry = 0
        while l1 != nil || l2 != nil || carry != 0 {
            let a = l1 == nil ? 0 : l1!.val
            let b = l2 == nil ? 0 : l2!.val
            let sum = a + b + carry
            curr?.next = ListNode(sum % 10)
            carry = sum >= 10 ? 1 : 0
            // 保存答案
            if resu == nil {
                resu = curr?.next
            }
            // 进入下一位
            curr = curr?.next
            l1 = l1?.next
            l2 = l2?.next
        }
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
//node0.next = node1
//node1.next = node2

//node3.next = node4
//node4.next = node5
desc(so.addTwoNumbers(node0, node3))

