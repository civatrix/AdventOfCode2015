//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    func testDay() throws {
        let input = "abcdef"
        XCTAssertEqual(day.run(input: input), "609043")
    }
    
    func testDay2() throws {
        let input = "pqrstuv"
        XCTAssertEqual(day.run(input: input), "1048970")
    }
}
