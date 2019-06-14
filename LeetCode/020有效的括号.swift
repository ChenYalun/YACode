//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1:
 
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 示例 3:
 
 输入: "(]"
 输出: false
 示例 4:
 
 输入: "([)]"
 输出: false
 示例 5:
 
 输入: "{[]}"
 输出: true
 
 "([)"
 */

// 方法一:
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [String]()
        let info: [Character: Character] = ["}": "{", ")": "(", "]": "["]
        for item in s {
            if stack.count > 0 && info[item] == Character(stack.last!) {
                // 栈不为空且括号匹配则出栈
                stack.removeLast()
            } else {
                // 进栈
                stack.append(String(item))
            }
        }
        return stack.count == 0
    }
}


// 方法二:
/*
class Solution {
    func isValid(_ s: String) -> Bool {
        var s = s
        while s.contains("{}") || s.contains("()") || s.contains("[]"){
            s = s.replacingOccurrences(of: "{}", with: "")
            s = s.replacingOccurrences(of: "()", with: "")
            s = s.replacingOccurrences(of: "[]", with: "")
        }
        return s.isEmpty
    }
}
*/
let s = Solution()
print(s.isValid("()"))
print(s.isValid("()[]{}"))
print(s.isValid("(]"))
print(s.isValid("([)]"))
print(s.isValid("{[]}"))
print(s.isValid("([)"))
print(s.isValid("(])"))

