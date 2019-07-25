//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=119 lang=swift
 *
 * [119] 杨辉三角 II
 *
 * https://leetcode-cn.com/problems/pascals-triangle-ii/description/
 *
 * algorithms
 * Easy (56.37%)
 * Total Accepted:    18.9K
 * Total Submissions: 33.1K
 * Testcase Example:  '3'
 *
 * 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 *
 *
 *
 * 在杨辉三角中，每个数是它左上方和右上方的数的和。
 *
 * 示例:
 *
 * 输入: 3
 * 输出: [1,3,3,1]
 *
 *
 * 进阶：
 *
 * 你可以优化你的算法到 O(k) 空间复杂度吗？
 *
 */

// 使用规律
// 1. 对于杨辉三角的同一行，第 ( i + 1) 项是第 i 项的( k - i ) /( i + 1 ) 倍
// 2. 同一行左右对称


// 方法一: 执行用时 :12 ms, 在所有 Swift 提交中击败了66.67%的用户
/*
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [Int]()
        var num = 1
        for i in 0...rowIndex  {
            result.append(num)
            num = num * (rowIndex - i) / (i + 1)
        }
        return result
    }
}
*/

// 方法二: 执行用时 :8 ms, 在所有 Swift 提交中击败了94.44%
// 方法二在方法一的基础上做了优化, 仅计算一半, 剩余一半根据数据的对称性复制
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [Int]()
        var num = 1
        for i in 0...rowIndex  {
            if i <= rowIndex / 2 {
                result.append(num)
                num = num * (rowIndex - i) / (i + 1)
            } else if rowIndex % 2 == 0 && i == (rowIndex + 1) / 2 {
                // 考虑rowIndex为偶数, 中间数据重复的情况
                continue
            } else {
                result.append(result[rowIndex-i])
            }
        }
        return result
    }
}

let so = Solution()
print(so.getRow(4))
