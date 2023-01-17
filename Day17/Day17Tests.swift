//
//  Day17Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day17Tests: XCTestCase {
    let day = Day17()
    
    func testDay() throws {
        let input =
"""
20
15
10
5
5
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
}
