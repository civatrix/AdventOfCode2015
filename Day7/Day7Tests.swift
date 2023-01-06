//
//  Day7Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    func testAssign() throws {
        let input =
"""
123 -> a
"""
        XCTAssertEqual(day.run(input: input), "123")
    }
    
    func testAnd() throws {
        let input =
"""
123 -> x
456 -> y
x AND y -> a
"""
        XCTAssertEqual(day.run(input: input), "72")
    }
    
    func testOr() throws {
        let input =
"""
123 -> x
456 -> y
x OR y -> a
"""
        XCTAssertEqual(day.run(input: input), "507")
    }
    
    func testLShift() throws {
        let input =
"""
123 -> x
x LSHIFT 2 -> a
"""
        XCTAssertEqual(day.run(input: input), "492")
    }
    
    func testRShift() throws {
        let input =
"""
456 -> x
x RSHIFT 2 -> a
"""
        XCTAssertEqual(day.run(input: input), "114")
    }
    
    func testNot() throws {
        let input =
"""
456 -> x
NOT x -> a
"""
        XCTAssertEqual(day.run(input: input), "65079")
    }
}
