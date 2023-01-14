//
//  Day14.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day14: Day {
    func run(input: String) -> String {
        let raceLength = 2503
        
        return input.lines.map { line in
            let numbers = line.allDigits
            let speed = numbers[0]
            let flyTime = numbers[1]
            let restTime = numbers[2]
            
            var distance = raceLength / (flyTime + restTime) * speed * flyTime
            let remainingTime = raceLength % (flyTime + restTime)
            if remainingTime < flyTime {
                distance += remainingTime * speed
            } else {
                distance += flyTime * speed
            }
            
            return distance
        }
        .max()!
        .description
    }
}
