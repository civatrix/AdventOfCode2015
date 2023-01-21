//
//  Day25.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day25: Day {
    func run(input: String) -> String {
        let multiply = 252533
        let remainder = 33554393
        let numbers = input.allDigits
        let row = numbers[0]
        let column = numbers[1]
        let diagonal = column + row - 1
        
        let target = (1 ... diagonal - 1).sum + column
        var result = 20151125
        for _ in 1 ..< target {
            result = (result * multiply) % remainder
        }
        
        return result.description
    }
}
