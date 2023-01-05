//
//  Day6.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day6: Day {
    func run(input: String) -> String {
        var lights = Set<Point>()
        
        for line in input.lines {
            let digits = line.allDigits
            let topLeft: Point = [digits[0], digits[1]]
            let bottomRight: Point = [digits[2], digits[3]]
            
            (topLeft.x ... bottomRight.x).forEach { x in
                (topLeft.y ... bottomRight.y).forEach { y in
                    let point = Point(x: x, y: y)
                    
                    if line.starts(with: "turn on") {
                        lights.insert(point)
                    } else if line.starts(with: "turn off") {
                        lights.remove(point)
                    } else if line.starts(with: "toggle") {
                        if lights.contains(point) {
                            lights.remove(point)
                        } else {
                            lights.insert(point)
                        }
                    } else {
                        fatalError("Invalid instruction: \(line)")
                    }
                }
            }
        }
        
        return lights.count.description
    }
}
