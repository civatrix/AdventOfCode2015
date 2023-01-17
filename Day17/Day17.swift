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
        
        return canFill(150, from: containers.sorted())
            .description
    }
    
    func canFill(_ amount: Int, from: [Int]) -> Int {
        from.indices.map {
            let size = from[$0]
            if size == amount {
                return 1
            } else if size > amount {
                return 0
            } else {
                return canFill(amount - size, from: Array(from.suffix(from: $0 + 1)))
            }
        }.sum
    }
}
