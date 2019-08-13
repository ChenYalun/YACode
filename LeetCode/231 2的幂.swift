//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2的幂
 *
 * https://leetcode-cn.com/problems/power-of-two/description/
 *
 * algorithms
 * Easy (46.17%)
 * Total Accepted:    26.7K
 * Total Submissions: 57.5K
 * Testcase Example:  '1'
 *
 * 给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
 *
 * 示例 1:
 *
 * 输入: 1
 * 输出: true
 * 解释: 2^0 = 1
 *
 * 示例 2:
 *
 * 输入: 16
 * 输出: true
 * 解释: 2^4 = 16
 *
 * 示例 3:
 *
 * 输入: 218
 * 输出: false
 *
 */

// 执行用时 :8 ms, 在所有 Swift 提交中击败了95.12%的用户
/*
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var x = 1
        while x != n {
            x <<= 1
            if x > n {
                return false
            }
        }
        return true
    }
}
*/
// 本来以为这样就完了, 谁知道还有更巧妙的方法
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        // 利用:
        /*
         整数  二进制
         1          1
         2         10
         3         11
         4        100
         7        111
         8       1000
         15      1111
         16     10000
        与前一个数相与运算, 结果为0
         */
       return (n > 0) && (n & (n - 1) == 0)
    }
}



let so = Solution()
assert(so.isPowerOfTwo(1))
assert(so.isPowerOfTwo(16))
assert(so.isPowerOfTwo(32))
assert(so.isPowerOfTwo(64))
assert(so.isPowerOfTwo(128))
assert(so.isPowerOfTwo(256))
assert(so.isPowerOfTwo(512))
assert(so.isPowerOfTwo(1024))
assert(so.isPowerOfTwo(1025) == false)
assert(so.isPowerOfTwo(218) == false)


