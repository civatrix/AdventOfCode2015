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
            let hasPair = line.contains(/(..).*\1/)
            let hasRepeat = line.contains(/(.).\1/)
            
            return hasPair && hasRepeat
        }
        .count
        .description
    }
}
