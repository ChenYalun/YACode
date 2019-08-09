//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=201 lang=swift
 *
 * [201] 数字范围按位与
 *
 * https://leetcode-cn.com/problems/bitwise-and-of-numbers-range/description/
 *
 * algorithms
 * Medium (40.05%)
 * Total Accepted:    3.7K
 * Total Submissions: 8.9K
 * Testcase Example:  '5\n7'
 *
 * 给定范围 [m, n]，其中 0 <= m <= n <= 2147483647，返回此范围内所有数字的按位与（包含 m, n 两端点）。
 *
 * 示例 1:
 *
 * 输入: [5,7]
 * 输出: 4
 *
 * 示例 2:
 *
 * 输入: [0,1]
 * 输出: 0
 *
 */
/*
 注意: 2的30次方是2147483647
 首先，将 [ 26 , 30 ] 的范围数字用二进制表示出来：
 11010　　11011　　11100　　11101　　11110
 而输出 24 的二进制是 11000
 可以发现，只要找到二进制的 左边公共部分 即可。
 
 所以，可以先建立一个 32 位都是 1 的 mask，然后每次向左移一位，比较 m 和 n 是否相同，不同再继续左移一位，直至相同，然后把 m 和 mask 相与就是最终结果。
 
 */

// 执行用时 :36 ms, 在所有 Swift 提交中击败了81.82%的用户
class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var mask = Int.max
        while m & mask != n & mask  {
            mask <<= 1
        }
        return mask & m
    }
}

let so = Solution()
print(so.rangeBitwiseAnd(5, 7))
print(so.rangeBitwiseAnd(26, 30))
print(so.rangeBitwiseAnd(0, 2147483647))

