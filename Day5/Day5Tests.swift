//
//  Day5Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    func testDay() throws {
        let input =
"""
qjhvhtzxzqqjkmpb
xxyxx
uurcxstgmygtbstg
ieodomkazucvgmuy
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
}
