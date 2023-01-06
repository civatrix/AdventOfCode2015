//
//  Day7.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day7: Day {
    func run(input: String) -> String {
        var lines = input.lines.map { $0.split(separator: " ") }
        var map = [Substring: UInt16]()
        
        var lineIndex = 0
        while map["a"] == nil {
            let line = lines[wrapped: lineIndex]
            
            if line.count == 3, let lhs = map[line[0]] ?? UInt16(line[0]) {
                map[line[2]] = lhs
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            } else if line.count == 4, let lhs = map[line[1]] {
                map[line[3]] = ~lhs
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            } else if line[1] == "AND", let lhs = map[line[0]] ?? UInt16(line[0]), let rhs = map[line[2]] ?? UInt16(line[2]) {
                map[line[4]] = lhs & rhs
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            } else if line[1] == "OR", let lhs = map[line[0]] ?? UInt16(line[0]), let rhs = map[line[2]] ?? UInt16(line[2]) {
                map[line[4]] = lhs | rhs
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            } else if line[1] == "LSHIFT", let lhs = map[line[0]] {
                map[line[4]] = lhs << UInt16(line[2])!
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            } else if line[1] == "RSHIFT", let lhs = map[line[0]] {
                map[line[4]] = lhs >> UInt16(line[2])!
                lines.remove(at: lineIndex % lines.count)
                lineIndex -= 1
            }
            
            lineIndex += 1
        }
        
        return map["a"]!.description
    }
}
