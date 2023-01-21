//
//  Day24.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day24: Day {
    struct CacheKey: Hashable {
        let numbers: [Int]
        let total: Int
        let allResults: Bool
    }
    
    var cache = [CacheKey: [[Int]]]()
    
    func run(input: String) -> String {
        let digits = input.allDigits.sorted(by: >)
        let target = digits.sum / 4
        
        let firstGroups = Set(groups(cacheKey: .init(numbers: digits, total: target, allResults: true))).sorted { $0.count < $1.count }
        var minCount = Int.max
        var minScore = Int.max
        for group in firstGroups {
            if group.count > minCount {
                continue
            } else if group.count == minCount && group.reduce(1, *) >= minScore {
                continue
            }
            
            let results = Set(groups(cacheKey: .init(numbers: digits, total: target, allResults: true)))
                .filter { group in !groups(cacheKey: .init(numbers: digits.filter { !group.contains($0) }, total: target, allResults: false)).isEmpty }

            if !results.isEmpty {
                minCount = group.count
                minScore = group.reduce(1, *)
            }
        }
        
        
        return minScore.description
    }
    
    func groups(cacheKey: CacheKey) -> [[Int]] {
        if let hit = cache[cacheKey] {
            return hit
        }
        
        let total = cacheKey.total
        let numbers = cacheKey.numbers.filter { $0 <= total }
        guard 0 < total && total <= numbers.sum else {
            cache[cacheKey] = []
            return []
        }
        
        var combinations = [[Int]]()
        for number in numbers {
            if number == total {
                combinations.append([total])
            } else {
                let results = groups(cacheKey: .init(numbers: numbers.filter { $0 < number }, total: total - number, allResults: cacheKey.allResults))
                if !results.isEmpty {
                    combinations.append(contentsOf: results.map { $0 + [number] })
                }
            }
            
            if !combinations.isEmpty && !cacheKey.allResults { break }
        }
        
        cache[cacheKey] = combinations
        return combinations
    }
}
