//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 856. 括号的分数
 给定一个平衡括号字符串 S，按下述规则计算该字符串的分数：
 
 () 得 1 分。
 AB 得 A + B 分，其中 A 和 B 是平衡括号字符串。
 (A) 得 2 * A 分，其中 A 是平衡括号字符串。
   
 示例 1：
 输入： "()"
 输出： 1
 示例 2：
 
 输入： "(())"
 输出： 2
 示例 3：
 
 输入： "()()"
 输出： 2
 示例 4：
 
 输入： "(()(()))"
 输出： 6
   
 
 提示：
 
 S 是平衡括号字符串，且只含有 ( 和 ) 。
 2 <= S.length <= 50
 */


class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        var list = Array(S)
        var sum = 0
        var c = 0
        for idx in 0..<list.count {
            if list[idx] == "(" {
                c += 1
            } else {
                c -= 1
                if list[idx] == ")" && list[idx - 1] == "(" {
                    // 左移运算给力
                    sum += 1 << c
                }
            }
        }
        return sum
    }
}


let s = Solution()
print(s.scoreOfParentheses("(()(()))"))





