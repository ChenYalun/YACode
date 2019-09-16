//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=447 lang=swift
 *
 * [447] 回旋镖的数量
 *
 * https://leetcode-cn.com/problems/number-of-boomerangs/description/
 *
 * algorithms
 * Easy (54.06%)
 * Total Accepted:    6.1K
 * Total Submissions: 11.1K
 * Testcase Example:  '[[0,0],[1,0],[2,0]]'
 *
 * 给定平面上 n 对不同的点，“回旋镖” 是由点表示的元组 (i, j, k) ，其中 i 和 j 之间的距离和 i 和 k
 * 之间的距离相等（需要考虑元组的顺序）。
 *
 * 找到所有回旋镖的数量。你可以假设 n 最大为 500，所有点的坐标在闭区间 [-10000, 10000] 中。
 *
 * 示例:
 *
 *
 * 输入:
 * [[0,0],[1,0],[2,0]]
 *
 * 输出:
 * 2
 *
 * 解释:
 * 两个回旋镖为 [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]]
 *
 *
 */

import Foundation
class Solution {
    func getDistance(_ a: [Int], _ b: [Int]) -> Decimal {
        let m = pow(Decimal(b[0] - a[0]), 2)
        let n = pow(Decimal(b[1] - a[1]), 2)
        return m + n
    }

    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        let count = points.count
        var res = 0
        for i in 0..<count {
            var dict = [Decimal: Int]()
            // 计算相等距离数
            for j in 0..<count {
                if i != j {
                    let distance = getDistance(points[i], points[j])
                    if dict[distance] == nil {
                        dict[distance] = 1
                    } else {
                        dict[distance]! += 1
                    }
                }
            }
            
            // 如果有 n 个点和点 a 距离相等，那么排列方式为 n(n-1)
            for value in dict.values {
                res += (value * (value - 1))
            }
        }
        return res
    }
}

assert(Solution().numberOfBoomerangs([[0,0],[1,0],[2,0]]) == 2)
