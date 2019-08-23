//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=342 lang=swift
 *
 * [342] 4的幂
 *
 * https://leetcode-cn.com/problems/power-of-four/description/
 *
 * algorithms
 * Easy (45.83%)
 * Total Accepted:    11.5K
 * Total Submissions: 24.7K
 * Testcase Example:  '16'
 *
 * 给定一个整数 (32 位有符号整数)，请编写一个函数来判断它是否是 4 的幂次方。
 *
 * 示例 1:
 *
 * 输入: 16
 * 输出: true
 *
 *
 * 示例 2:
 *
 * 输入: 5
 * 输出: false
 *
 * 进阶：
 * 你能不使用循环或者递归来完成本题吗？
 *
 */
// 执行用时 :12 , 在所有 Swift 提交中击败66.的用户
/*
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        var i = 1
        while i < num {
            i *= 4
        }
        return i == num
    }
}
*/


// 执行用时 :16 ms, 在所有 Swift 提交中击败了40.00%的用户
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        // 判断一个数是否是 2 的幂次方数使用的是位运算 n & ( n - 1 )
        if num <= 0 || num & (num - 1) != 0 {
            return false
        }
        // 4 的幂次方的数的二进制表示 1 的位置都是在奇数位
        // 如果用一个 4 的幂次方数和0b1010101010101010101010101010101做与运算，
        // 得到的还是 4 的幂次方数
        return num & 0b1010101010101010101010101010101 == num
    }
}


assert(Solution().isPowerOfFour(16))
assert(!Solution().isPowerOfFour(5))
assert(Solution().isPowerOfFour(1))
assert(Solution().isPowerOfFour(64))
assert(!Solution().isPowerOfFour(0))


