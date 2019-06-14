//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 21. 合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 */

class ListNode {
    public var val: Int
    public var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 方法一: 自己想的方法不太好
/*
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        
        var aNum = [Int]()
        while l1 != nil {
            aNum.append(l1!.val)
            l1 = l1?.next
        }
        
        var bNum = [Int]()
        while l2 != nil {
            bNum.append(l2!.val)
            l2 = l2?.next
        }
        
        var cNum = aNum + bNum
        cNum.sort()
        if cNum.count <= 0 {
            return nil
        }
        
        let node = ListNode(cNum[0])
        var tmp = node
        for idx in 1..<cNum.count {
            tmp.next = ListNode(cNum[idx])
            tmp = tmp.next!
        }
        return node
    }
}
*/

// 方法二:递归
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 考虑边界情况
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if l1!.val < l2!.val {
            // l1头结点值小于l2头结点值, 使得l1的next指针指向l1.next与l2的合并链表
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            // l1头结点值大于等于l2头结点值, 使得l2的next指针指向l2.next与l1的合并链表
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

let s = Solution()
var a = ListNode(1)
a.next = ListNode(2)
a.next?.next = ListNode(4)
var b = ListNode(1)
b.next = ListNode(3)
b.next?.next = ListNode(4)
s.mergeTwoLists(nil, nil)
s.mergeTwoLists(nil, ListNode(4))
s.mergeTwoLists(a, b)

