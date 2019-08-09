//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=187 lang=swift
 *
 * [187] 重复的DNA序列
 *
 * https://leetcode-cn.com/problems/repeated-dna-sequences/description/
 *
 * algorithms
 * Medium (42.43%)
 * Total Accepted:    4.4K
 * Total Submissions: 10K
 * Testcase Example:  '"AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"'
 *
 * 所有 DNA 由一系列缩写为 A，C，G 和 T 的核苷酸组成，例如：“ACGAATTCCG”。在研究 DNA 时，识别 DNA
 * 中的重复序列有时会对研究非常有帮助。
 *
 * 编写一个函数来查找 DNA 分子中所有出现超过一次的10个字母长的序列（子串）。
 *
 * 示例:
 *
 * 输入: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 *
 * 输出: ["AAAAACCCCC", "CCCCCAAAAA"]
 *
 */


/*
// 初版, 会超时
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count < 10 {
            return []
        }
        // 子串为key 次数为value
        var strDict = [String: Int]()
        // 每次增加一个字符遍历
        for idx in 0...(s.count - 10) {
            let str = s[idx...idx+9]
            if strDict[str] == nil {
                strDict[str] = 1
            } else {
                strDict[str]! += 1
            }
        }
        // 结果数组
        var strArray = [String]()
        for key in strDict.keys {
            if strDict[key]! > 1 {
                strArray.append(key)
            }
        }
        return strArray
    }
}


// 使用set, 还是会超时😂, 应该是Swift截取字符串效率太低
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count < 10 {
            return []
        }
        var set = Set<String>()
        var dict = [String: Bool]()
        for idx in 9..<s.count {
            let key = s[idx-9...idx]
            if dict[key] != nil {
                set.insert(key)
            } else {
                dict[key] = true
            }
        }
        return Array(set)
    }
}


// 转换成Array成功了:执行用时 :340 ms, 在所有 Swift 提交中击败了75.00%的用户
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count < 10 {
            return []
        }
        var set = Set<String>()
        var dict = [String: Bool]()
        var s = Array(s)
        for idx in 9..<s.count {
            let key = String(s[idx-9...idx])
            if dict[key] != nil {
                set.insert(key)
            } else {
                dict[key] = true
            }
        }
        return Array(set)
    }
}
*/

/*
网上发现一种方法, ACGT分别使用数字表示, 每10个字符计算出一个唯一的结果, 把它存在字典中, 结果作为key, 出现的次数作为value, 当出现的次数为2次时, 放到结果数组中, 之所以判断为2次, 是为了避免同样的子串被添加多次. 最关键的是如果计算出一个唯一的结果:逐个遍历,从0开始,先乘以4, 再加上自己对应的数字,循环, 这样就保证了唯一性:
 以 AB为例, A对应0, B对应1, 这里只有两个字符, 所以乘以2
 AA (0*2+0)*2+0 = 0
 AB (0*2+0)*2+1 = 1
 BA (0*2+1)*2+0 = 2
 BB (0*2+1)*2+1 = 3
 256*256*4 //pow(4, 9)
 
 */
// 执行用时 :80 ms, 在所有 Swift 提交中击败了100.00%
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        // 小于10字符
        guard s.count > 10 else {
            return []
        }
        
        // 结果
        var result = [String]()
        // 常量字典
        let defaultDict = ["A":0, "C":1, "G":2, "T":3]
        // 次数字典
        var countDict = [Int: Int]()
        let array = Array(s)
        // 最大值
        let max = 256*256*4
        // 基础值
        var num = 0
        
        // 前9个字符计算
        for idx in 0..<9 {
            num *= 4
            num += defaultDict[String(array[idx])]!
        }
        for idx in 9..<array.count {
            num %= max
            num *= 4
            num += defaultDict[String(array[idx])]!
            countDict[num, default:0] += 1
            if countDict[num, default:0] == 2 {
                result.append(String(array[idx-9...idx]))
            }
        }
        return result
    }
}

let so = Solution()
//print(so.findRepeatedDnaSequences("AAAAAAAAAAAAAAAAAAAA"))

print(so.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))

