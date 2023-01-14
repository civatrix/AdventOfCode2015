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
        
        let reindeer = input.lines.map { line in
            let numbers = line.allDigits
            let speed = numbers[0]
            let flyTime = numbers[1]
            let restTime = numbers[2]
            
            return (speed: speed, flyTime: flyTime, restTime: restTime)
        }
        
        var scores = [Int](repeating: 0, count: reindeer.count)
        for time in 1 ... raceLength {
            let distances = reindeer.map {
                var distance = time / ($0.flyTime + $0.restTime) * $0.speed * $0.flyTime
                let remainingTime = time % ($0.flyTime + $0.restTime)
                if remainingTime < $0.flyTime {
                    distance += remainingTime * $0.speed
                } else {
                    distance += $0.flyTime * $0.speed
                }
                return distance
            }
            
            let maxDistance = distances.max()!
            distances.enumerated().filter { $0.element == maxDistance }.forEach { scores[$0.offset] += 1 }
        }
        
        return scores
        .max()!
        .description
    }
}
