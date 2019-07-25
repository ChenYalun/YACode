//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=118 lang=swift
 *
 * [118] 杨辉三角
 *
 * https://leetcode-cn.com/problems/pascals-triangle/description/
 *
 * algorithms
 * Easy (62.63%)
 * Total Accepted:    28.8K
 * Total Submissions: 45.7K
 * Testcase Example:  '5'
 *
 * 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 *
 *
 *
 * 在杨辉三角中，每个数是它左上方和右上方的数的和。
 *
 * 示例:
 *
 * 输入: 7
 * 输出:
 * [
 * ⁠     [1],
 * ⁠    [1,1],
 * ⁠   [1,2,1],
 * ⁠  [1,3,3,1],
 * ⁠ [1,4,6,4,1]
 *[1, 5, 10, 10, 5, 1]
*[1, 6, 15, 20, 15, 6, 1]
 * ]
 *
 */

// 递归写法
// 执行用时 :16 ms, 在所有 Swift 提交中击败了58.33%的用户
/*
class Solution {
    // 生成某一行的元素数组
    func generateList(_ numRows: Int) -> [Int] {
        if numRows == 1 {
            return [1]
        } else if numRows == 2 {
            return [1, 1]
        }
        var list = [Int]()
        var lastList = generateList(numRows - 1)
        // 首位元素拿下来
        list.append(lastList[0])
        for idx in 0..<numRows - 2 {
            list.append(lastList[idx] + lastList[idx + 1])
        }
        // 末尾元素拿下来
        list.append(lastList[numRows - 2])
        return list
    }
    
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        var list = [[Int]]()
        for idx in 1...numRows {
            list.append(generateList(idx))
        }
        return list
    }
}
*/

// 执行用时 :8 ms, 在所有 Swift 提交中击败了100.00%的用户
class Solution {
    // 迭代写法
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]
        if numRows == 0 {
            return []
        } else if numRows == 1 {
            return result
        }
        for i in 2...numRows {
            var list = [Int]()
            var front = result[i - 2]
            for j in 0..<i {
                if j == 0 {
                    list.append(1)
                } else if j == i - 1 {
                    list.append(1)
                } else {
                    list.append(front[j - 1] + front[j])
                }
            }
            result.append(list)
        }
        return result
    }
}


let so = Solution()
print(so.generate(9))
