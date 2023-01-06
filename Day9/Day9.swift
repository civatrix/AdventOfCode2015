//
//  Day9.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day9: Day {
    func run(input: String) -> String {
        var distances = [Substring: [Substring: Int]]()
        for line in input.lines {
            let split = line.split(separator: " ")
            distances[split[0], default: [:]][split[2]] = Int(split[4])!
            distances[split[2], default: [:]][split[0]] = Int(split[4])!
        }
        
        return distances.keys.permutations().map { option in
            return option.adjacentPairs().map { distances[$0.0]![$0.1]! }.sum
        }
        .max()!
        .description
    }
}
