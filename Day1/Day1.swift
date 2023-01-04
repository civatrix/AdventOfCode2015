//
//  Day1.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day1: Day {
    func run(input: String) -> String {
        return (input.filter { $0 == "(" }.count - input.filter { $0 == ")" }.count).description
    }
}
