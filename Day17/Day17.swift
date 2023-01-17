//
//  Day17.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day17: Day {
    func run(input: String) -> String {
        let containers = input.allDigits
        
        let possibleFills = canFill(150, from: containers.sorted())
        let minCount = possibleFills.map { $0.count }.min()!
        return possibleFills.filter { $0.count == minCount }.count.description
    }
    
    func canFill(_ amount: Int, from: [Int]) -> [[Int]] {
        from.indices.flatMap {
            let size = from[$0]
            if size == amount {
                return [[size]]
            } else if size > amount {
                return []
            } else {
                return canFill(amount - size, from: Array(from.suffix(from: $0 + 1))).map { $0 + [size] }
            }
        }
    }
}
