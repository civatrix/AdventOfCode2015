//
//  Day18.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day18: Day {
    let range = 0 ..< 100
    
    func run(input: String) -> String {
        let alwaysOn: Set<Point> = [[range.first!, range.first!], [range.first!, range.last!], [range.last!, range.first!], [range.last!, range.last!]]
        var lights: Set<Point> = alwaysOn
        
        for (y, line) in input.lines.enumerated() {
            for (x, char) in line.enumerated() where char == "#" {
                lights.insert([x, y])
            }
        }
        
        for _ in 0 ..< 100 {
            let newOn = lights.filter {
                (2...3).contains($0.neighbours.filter { lights.contains($0) }.count)
            }
            
            let off = Set(lights.flatMap { $0.neighbours }.filter { range.contains($0.x) && range.contains($0.y) }).subtracting(lights)
            lights = newOn.union(off.filter { $0.neighbours.filter { lights.contains($0) }.count == 3 }).union(alwaysOn)
        }
        
        return lights.count.description
    }
}
