//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
13. 罗马数字转整数
罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

示例 1:

输入: "III"
输出: 3
示例 2:

输入: "IV"
输出: 4
示例 3:

输入: "IX"
输出: 9
示例 4:

输入: "LVIII"
输出: 58
解释: L = 50, V= 5, III = 3.
示例 5:

输入: "MCMXCIV"
输出: 1994
解释: M = 1000, CM = 900, XC = 90, IV = 4.
*/

// 自己想的
/*
class Solution {
    func romanToInt(_ s: String) -> Int {
        // IV+4 IX+9 XL+40 XC+90 CD+400 CM+900
        // I+1 V+5 X+10 L+50 C+100 D+500 M+1000
        var str = s
        let aDict = ["IV": "+4", "IX": "+9", "XL": "+40", "XC": "+90", "CD": "+400", "CM": "+900"]
        let bDict = ["I": "+1", "V": "+5", "X": "+10", "L": "+50", "C": "+100", "D": "+500", "M": "+1000"]
        for (key, value) in aDict {
            if str.contains(key) {
                str = str.replacingOccurrences(of: key, with: value)
            }
        }
        for (key, value) in bDict {
            if str.contains(key) {
                str = str.replacingOccurrences(of: key, with: value)
            }
        }
        let nums = str.components(separatedBy: "+")
        var sum = 0
        for num in nums {
            sum += Int(num) ?? 0
        }
        return sum
    }
}
*/


// 参考答案
/*
 思路：
 罗马数字对应两种排列方式：
 从左到右，从大到小排列，直接根据罗马字符对应的数值累加即可: 如"LVIII"为50+5+1+1+1
 从左到右，从小到大排列，用大的罗马字符对应的数值减去小的罗马字符对应的数值: 如"IIV"为1-1+5
 
 将问题转化为取最大值：
 从右向左遍历, 遇到字符对应数值大于当前最大值, 使用累积和加上;
 遇到字符对应数值小于当前最大值, 使用累积和减去;
 */

class Solution {
    func romanToInt(_ s: String) -> Int  {
        var sum = 0
        var max = 0
        var value = 0
        
        for key in s.reversed() {
            switch key {
            case "I": value = 1
            case "V": value = 5
            case "X": value = 10
            case "L": value = 50
            case "C": value = 100
            case "D": value = 500
            case "M": value = 1000
            default: value = 0
            }
            
            if value >= max {
                max = value
                sum += value
            } else {
                sum -= value
            }
        }
        return sum
    }
}

let s = Solution()
s.romanToInt("III")
s.romanToInt("IV")
s.romanToInt("IX")
s.romanToInt("LVIII")
s.romanToInt("MCMXCIV")
