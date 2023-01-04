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
                let sides = [
                    line[0] * line[1],
                    line[0] * line[2],
                    line[1] * line[2],
                ]
                
                return sides.map { $0 * 2 }.sum + sides.min()!
            }
            .sum
            .description
    }
}
