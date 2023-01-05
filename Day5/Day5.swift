//
//  Day5.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day5: Day {
    func run(input: String) -> String {
        return input.lines.filter { line in
            let has3Vowels = line.contains(/[aeiou].*[aeiou].*[aeiou]/)
            let hasPair = line.contains(/(.)\1/)
            let hasIllegalPair = line.contains(/(ab)|(cd)|(pq)|(xy)/)
            
            return has3Vowels && hasPair && !hasIllegalPair
        }
        .count
        .description
    }
}
