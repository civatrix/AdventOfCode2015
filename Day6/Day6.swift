//
//  Day6.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day6: Day {
    func run(input: String) -> String {
        var lights = [Point: Int]()
        
        for line in input.lines {
            let digits = line.allDigits
            let topLeft: Point = [digits[0], digits[1]]
            let bottomRight: Point = [digits[2], digits[3]]
            
            (topLeft.x ... bottomRight.x).forEach { x in
                (topLeft.y ... bottomRight.y).forEach { y in
                    let point = Point(x: x, y: y)
                    
                    if line.starts(with: "turn on") {
                        lights[point, default: 0] += 1
                    } else if line.starts(with: "turn off") {
                        if lights[point, default: 0] > 0 {
                            lights[point, default: 0] -= 1
                        }
                    } else if line.starts(with: "toggle") {
                        lights[point, default: 0] += 2
                    } else {
                        fatalError("Invalid instruction: \(line)")
                    }
                }
            }
        }
        
        return lights.values.sum.description
    }
}
