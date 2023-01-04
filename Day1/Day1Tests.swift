//
//  Day1Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testDay() throws {
        let input = ")"
        XCTAssertEqual(day.run(input: input), "1")
    }
    
    func testDay2() throws {
        let input = "()())"
        XCTAssertEqual(day.run(input: input), "5")
    }
}
