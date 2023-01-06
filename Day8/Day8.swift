//
//  Day8.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day8: Day {
    func run(input: String) -> String {
        let lines = input.lines
        let codeCount = lines.map { $0.count }.sum
        let memoryCount = lines.map { $0.replacing(/(\\)|(\")/, with: "--").count + 2 }.sum
        
        return (memoryCount - codeCount).description
    }
}
