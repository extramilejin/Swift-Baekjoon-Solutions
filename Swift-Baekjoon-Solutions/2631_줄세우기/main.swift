//
//  main.swift
//  2631_줄세우기
//
//  Created by 진형진 on 2021/05/05.
//  time: O(n) space: O(n)

import Foundation

let N = Int(readLine()!)!
var children = [Int]()
var dp = [Int](repeating: 0, count: N)
var lis = 1

for _ in 0..<N {
    let child = Int(readLine()!)!
    children.append(child)
}

dp[0] = 1

for i in 1..<N {
    dp[i] = 1
    for j in 0..<i {
        if children[j] < children[i] && dp[j] + 1 > dp[i] {
            dp[i] = dp[j] + 1
        }
    }
    if dp[i] > lis {
        lis = dp[i]
    }
}
print(N - lis)


