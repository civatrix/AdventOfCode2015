//
//  Day9Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    func testDay() throws {
        let input =
"""
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141
"""
        XCTAssertEqual(day.run(input: input), "605")
    }
}
