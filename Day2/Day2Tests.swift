//
//  Day2Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testDay() throws {
        let input =
"""
2x3x4
1x1x10
"""
        XCTAssertEqual(day.run(input: input), "101")
    }
}
