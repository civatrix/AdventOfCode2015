//
//  Day20.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day20: Day {
    func run(input: String) -> String {
        let target = Int(input)!
        
        var house = 1
        while true {
            var presents = 0
            for elf in 1 ... Int(Double(house).squareRoot()) where house % elf == 0 {
                presents += elf * 10
                presents += (house / elf) * 10
            }
            
            if presents >= target { break }
            house += 1
        }
        
        return house.description
    }
}
