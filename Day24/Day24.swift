//
//  Day24.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day24: Day {
    func run(input: String) -> String {
        let digits = input.allDigits.sorted(by: >)
        let target = digits.sum / 3
        
        let results = Set(groups(of: digits, totalling: target, allResults: true))
            .filter { group in !groups(of: digits.filter { !group.contains($0) }, totalling: target, allResults: false).isEmpty }
        
        let minCount = results.map { $0.count }.min()!
        
        return results.filter { $0.count == minCount }
            .map { $0.reduce(1, *) }
            .min()!
            .description
    }
    
    func groups(of numbers: [Int], totalling total: Int, allResults: Bool) -> [[Int]] {
        guard total > 0 else { return [] }
        
        var combinations = [[Int]]()
        for number in numbers.filter({ $0 <= total }) {
            if number == total {
                combinations.append([total])
            } else {
                let results = groups(of: numbers.filter { $0 < number }, totalling: total - number, allResults: allResults)
                if !results.isEmpty {
                    combinations.append(contentsOf: results.map { $0 + [number] })
                }
            }
            
            if !combinations.isEmpty && !allResults { break }
        }
        
        return combinations
    }
}
