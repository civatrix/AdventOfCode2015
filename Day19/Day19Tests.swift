//
//  Day19Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day19Tests: XCTestCase {
    let day = Day19()
    
    func testDay() throws {
        let input =
"""
H => HO
H => OH
O => HH

HOH
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
    
    func testDay2() throws {
        let input =
"""
H => HO
H => OH
O => HH

HOHOHO
"""
        XCTAssertEqual(day.run(input: input), "7")
    }
}
