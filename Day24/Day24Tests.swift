//
//  Day24Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day24Tests: XCTestCase {
    let day = Day24()
    
    func testDay() throws {
        let input = "1 2 3 4 5 7 8 9 10 11"
        XCTAssertEqual(day.run(input: input), "99")
    }
}
