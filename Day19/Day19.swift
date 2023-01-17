//
//  Day19.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day19: Day {
    func run(input: String) -> String {
        var replacements = [Substring: [Substring]]()
        
        let parseRegex = /([A-Z][a-z]?) => (\w+)/
        for line in input.lines {
            guard let match = line.wholeMatch(of: parseRegex)?.output else { continue }
            replacements[match.1, default: []].append(match.2)
        }
        
        let starter = input.lines.last!
        let moleculeRegex = /([A-Z][a-z]?)/
        
        var output = Set<String>()
        for match in starter.matches(of: moleculeRegex) {
            for replacement in replacements[match.output.1] ?? [] {
                output.insert(starter.replacingCharacters(in: match.range, with: replacement))
            }
        }
        
        return output.count.description
    }
}
