//
//  Day6Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    func testDay() throws {
        let input =
"""
turn on 0,0 through 999,999
toggle 0,0 through 999,0
turn off 499,499 through 500,500
"""
        XCTAssertEqual(day.run(input: input), "998996")
    }
}
