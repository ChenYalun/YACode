//
//  List.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

import Foundation
/* 001
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */


import Foundation

// 方法一: 暴力循环
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for idx in 0..<nums.count {
            let currentValue = nums[idx]
            for newIdx in idx + 1..<nums.count {
                let newValue = nums[newIdx]
                if currentValue + newValue == target {
                    return [idx, newIdx]
                }
            }
        }
        return []
    }
}


// 方法二: 使用数组的contains函数
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for idx in 0..<nums.count {
            let currentValue = nums[idx]
            let newValue = target - currentValue
            if nums.contains(newValue) { // 包含目标值
                let newIdx = nums.index(of: newValue)!
                if newIdx != idx { // 屏蔽掉两个索引指向同一个值的情况
                    return [idx, newIdx]
                }
            }
        }
        return []
    }
}


// 参考答案:
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]() // key是值, value是索引
        for index in 0 ..< nums.count { // 边遍历边填充
            if let lastIndex = dict[target - nums[index]] {
                return [lastIndex, index]
            } else {
                dict[nums[index]] = index
            }
        }
        return []
    }
}

var s = Solution()
print(s.twoSum([3, 2, 4], 6))

