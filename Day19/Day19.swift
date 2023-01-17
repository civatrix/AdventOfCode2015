//
//  Day19.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day19: Day {
    func run(input: String) -> String {
        let target = input.lines.last!
        let chemicalRegex = /[A-Z][a-z]?/
        
        return (target.matches(of: chemicalRegex).count - target.matches(of: /(Rn)|(Ar)/).count - (2 * target.matches(of: /Y/).count) - 1).description
        
//        This works but is way too slow
//        var replacements = [Substring: [Substring]]()
//
//        let parseRegex = /([A-Ze][a-z]?) => (\w+)/
//        for line in input.lines {
//            guard let match = line.wholeMatch(of: parseRegex)?.output else { continue }
//            replacements[match.1, default: []].append(match.2)
//        }
//
//        let target = input.lines.last!
//        let moleculeRegex = /([A-Ze][a-z]?)/
//
//        var stack = [(current: "e", time: 0)]
//        var cache = [String: Int]()
//        var best = Int.max
//        func addToStack(_ new: (current: String, time: Int)) {
//            guard new.time < best else { return }
//            if let cacheHit = cache[new.current], new.time >= cacheHit { return }
//
//            cache[new.current] = new.time
//            stack.append(new)
//
//            if new.current == target {
//                best = new.time
//                stack = stack.filter { $0.time < best }
//            }
//        }
//
//        while !stack.isEmpty {
//            let next = stack.removeFirst()
//            for match in next.current.matches(of: moleculeRegex) {
//                for replacement in replacements[match.output.1] ?? [] {
//                    addToStack((current: next.current.replacingCharacters(in: match.range, with: replacement), time: next.time + 1))
//                }
//            }
//        }
//
//        return best.description
    }
}
