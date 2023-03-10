//
//  Day23.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day23: Day {
    func run(input: String) -> String {
        let elfCode = ElfCode(input.lines)
        elfCode.run()
        
        return elfCode.registers["b"]!.description
    }
}
