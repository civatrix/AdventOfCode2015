//
//  Day3Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testDay() throws {
        let input = ">"
        XCTAssertEqual(day.run(input: input), "2")
    }
    
    func testDay2() throws {
        let input = "^>v<"
        XCTAssertEqual(day.run(input: input), "4")
    }
    
    func testDay3() throws {
        let input = "^v^v^v^v^v"
        XCTAssertEqual(day.run(input: input), "2")
    }
}
