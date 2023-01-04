//
//  Day3.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day3: Day {
    func run(input: String) -> String {
        var set = Set<Point>([.zero])
        
        var point = Point.zero
        for char in input {
            switch char {
            case "<": point += .left
            case ">": point += .right
            case "^": point += .up
            case "v": point += .down
            default: fatalError("Unknown direction: \(char)")
            }
            
            set.insert(point)
        }
        
        return set.count.description
    }
}
