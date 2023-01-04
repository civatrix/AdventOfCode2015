//
//  Day2.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day2: Day {
    func run(input: String) -> String {
        return input.lines
            .map { $0.allDigits }
            .map { line in
                line.sorted().prefix(2).map { $0 * 2 }.sum + line.reduce(1, *)
            }
            .sum
            .description
    }
}
