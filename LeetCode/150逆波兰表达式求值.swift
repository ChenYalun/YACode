//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=150 lang=swift
 *
 * [150] 逆波兰表达式求值
 *
 * https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/description/
 *
 * algorithms
 * Medium (44.61%)
 * Total Accepted:    11.6K
 * Total Submissions: 25.7K
 * Testcase Example:  '["2","1","+","3","*"]'
 *
 * 根据逆波兰表示法，求表达式的值。
 *
 * 有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
 *
 * 说明：
 *
 *
 * 整数除法只保留整数部分。
 * 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
 *
 *
 * 示例 1：
 *
 * 输入: ["2", "1", "+", "3", "*"]
 * 输出: 9
 * 解释: ((2 + 1) * 3) = 9
 *
 *
 * 示例 2：
 *
 * 输入: ["4", "13", "5", "/", "+"]
 * 输出: 6
 * 解释: (4 + (13 / 5)) = 6
 *
 *
 * 示例 3：
 *
 * 输入: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
 * 输出: 22
 * 解释:
 * ⁠ ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 * = ((10 * (6 / (12 * -11))) + 17) + 5
 * = ((10 * (6 / -132)) + 17) + 5
 * = ((10 * 0) + 17) + 5
 * = (0 + 17) + 5
 * = 17 + 5
 * = 22
 *
 */

// 使用栈解决
// 执行用时 :108 ms, 在所有 Swift 提交中击败了83.33%的用户
class Solution {
    func calculate(_ a: Int, _ b: Int, _ s: String) -> Int {
        switch s {
            case "+": return a + b
            case "-": return a - b
            case "*": return a * b
            case "/": return a / b
            default:return 0
        }
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = Array<Int>()
        for item in tokens {
            if let intValue = Int(item) {
                // 数字则入栈
                stack.append(intValue)
            } else {
                // 符号则出栈
                let a = stack.popLast()!
                let b = stack.popLast()!
                stack.append(calculate(b, a, item))
            }
        }
        return stack.popLast()!
    }
}

let so = Solution()
var a = so.evalRPN(["2", "1", "+", "3", "*"])
print(a)
a = so.evalRPN(["4", "13", "5", "/", "+"])
print(a)
a = so.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
print(a)
