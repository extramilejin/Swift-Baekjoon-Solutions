//
//  main.swift
//  11657_타임머신
//
//  Created by 진형진 on 2021/05/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]

var routeInfo = Array(repeating: [(Int , Int)](), count: N + 1)
var distsFromFirstCity = [Int](repeating: Int.max, count: N + 1)
var isCycle = false

for _ in 0..<M {
    let ABC = readLine()!.split(separator: " ").map{Int($0)!}
    routeInfo[ABC[0]].append((ABC[1] , ABC[2]))
}

distsFromFirstCity[1] = 0

for i in 1...N {
    for j in 1...N {
        for k in 0..<routeInfo[j].count {
            let nextCity = routeInfo[j][k].0
            let cost = routeInfo[j][k].1
            if distsFromFirstCity[j] != Int.max && distsFromFirstCity[nextCity] > distsFromFirstCity[j] + cost {
                distsFromFirstCity[nextCity] = distsFromFirstCity[j] + cost
                if i == N {
                    isCycle = true
                    break
                }
            }
        }
    }
}

if isCycle {
    print(-1)
} else {
    for i in 2...N {
        if distsFromFirstCity[i] == Int.max {
            print(-1)
        } else {
            print(distsFromFirstCity[i])
        }
    }
}
