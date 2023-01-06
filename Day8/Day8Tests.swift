//
//  Day8Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    func testDay() throws {
        let input =
"""
""
"abc"
"aaa\\"aaa"
"\\x27"
"""
        XCTAssertEqual(day.run(input: input), "19")
    }
}
