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
        
        var santa = Point.zero
        var robo = Point.zero
        for char in input.chunks(ofCount: 2) {
            switch char.first! {
            case "<": santa += .left
            case ">": santa += .right
            case "^": santa += .up
            case "v": santa += .down
            default: fatalError("Unknown direction: \(char)")
            }
            
            switch char.last! {
            case "<": robo += .left
            case ">": robo += .right
            case "^": robo += .up
            case "v": robo += .down
            default: fatalError("Unknown direction: \(char)")
            }
            
            set.insert(santa)
            set.insert(robo)
        }
        
        return set.count.description
    }
}
