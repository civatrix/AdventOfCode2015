//
//  Day14Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day14Tests: XCTestCase {
    let day = Day14()
    
    func testDay() throws {
        let input =
"""
Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
"""
        XCTAssertEqual(day.run(input: input), "1564")
    }
}
