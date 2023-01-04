//
//  Day1.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day1: Day {
    func run(input: String) -> String {
        var floor = 0
        for (index, char) in input.enumerated() {
            if char == "(" {
                floor += 1
            } else {
                floor -= 1
            }
            
            if floor == -1 {
                return (index + 1).description
            }
        }
        
        return "not found"
    }
}
