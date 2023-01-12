//
//  Day11Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testDay() throws {
        let input = "abcdefgh"
        XCTAssertEqual(day.run(input: input), "abcdffaa")
    }
    
    func testDay2() throws {
        let input = "ghijklmn"
        XCTAssertEqual(day.run(input: input), "ghjaabcc")
    }
}
