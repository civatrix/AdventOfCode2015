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
        let input = "^v"
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay2() throws {
        let input = "^>v<"
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay3() throws {
        let input = "^v^v^v^v^v"
        XCTAssertEqual(day.run(input: input), "11")
    }
}
