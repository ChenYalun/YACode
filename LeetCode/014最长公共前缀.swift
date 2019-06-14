//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 14. 最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 输入: ["flower","flow","flight"]
 输出: "fl"
 
 示例 2:
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 
 
 方法:
 拿到数组的第0个字符串作为默认前缀, 将其与剩下的字符串逐个比较, 每次比较时进入一个对比循环中,
 循环的操作是:每次减去默认前缀末尾的一个字符, 直到它与比较的字符串的前部分一致.
 
 */


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let count = strs.count
        // 空数组
        if count <= 0 {
            return ""
        }
        var prefix = strs[0]
        for idx in 1..<count{
            let str = strs[idx]
            while (!str.hasPrefix(prefix)) {
                prefix = String(prefix[..<prefix.index(prefix.startIndex, offsetBy: prefix.count - 1)])
                if (prefix.isEmpty) {
                    // 前缀没有匹配
                    return ""
                }
            }
        }
        return prefix
    }
}


let s = Solution()

let re = s.longestCommonPrefix(["ab", "abc", "abd", "abe"])
print(re)
