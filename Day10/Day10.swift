//
//  Day10.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day10: Day {
    func run(input: String) -> String {
        var output = input.dropLast()
        
        for _ in 0 ..< 40 {
            output = lookAndSay(output)
        }
        
        return output.count.description
    }
    
    func lookAndSay(_ input: Substring) -> Substring {
        var output: Substring = ""
        var current = input.first!
        var length = 1
        for char in input.dropFirst() {
            if char == current {
                length += 1
            } else {
                output += "\(length)\(current)"
                length = 1
                current = char
            }
        }
        
        output += "\(length)\(current)"
        return output
    }
}
