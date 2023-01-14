//
//  Day13.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day13: Day {
    let regex = Regex {
        Capture { OneOrMore(.word) }
        " would "
        Capture { OneOrMore(.word) }
        " "
        TryCapture { OneOrMore(.digit) } transform: { Int($0) }
        " happiness units by sitting next to "
        Capture { OneOrMore(.word) }
        "."
    }
    
    func run(input: String) -> String {
        var happiness = [Substring: [Substring: Int]]()
        for line in input.lines {
            let match = line.wholeMatch(of: regex)!.output
            let sign = match.2 == "gain" ? 1 : -1
            happiness[match.1, default: [:]][match.4] = sign * match.3
        }
        
        var maxHappiness = 0
        for permutation in happiness.keys.permutations() {
            let happiness = (permutation + [permutation[0]]).adjacentPairs().map { happiness[$0.0]![$0.1]! + happiness[$0.1]![$0.0]! }.sum
            maxHappiness = max(happiness, maxHappiness)
        }
        
        return maxHappiness.description
    }
}
