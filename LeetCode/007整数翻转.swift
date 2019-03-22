//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:
输入: 123
输出: 321
 
示例 2:
输入: -123
输出: -321
 
示例 3:
输入: 120
输出: 21
注意:假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231, 231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
*/

import Foundation
class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var result: Int = 0
        while num != 0 {
            // 取余
            let value = num % 10
            num /= 10 // 最后次成为0
            result *= 10 // 先放大倍数
            result += value // 再增加余数
        }
        let max: CGFloat = pow(2, 31) // 转化为CGFloat
        if result > Int(max - 1) || result < Int(-max) {
            return 0
        }
        return result
    }
}
let solution = Solution()
print(solution.reverse(-123342))
