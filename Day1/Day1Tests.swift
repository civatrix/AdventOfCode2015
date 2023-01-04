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
        let input = "(())"
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay2() throws {
        let input = "()()"
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay3() throws {
        let input = "((("
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay4() throws {
        let input = "(()(()("
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay5() throws {
        let input = "))((((("
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay6() throws {
        let input = "())"
        XCTAssertEqual(day.run(input: input), "-1")
    }
    
    func testDay7() throws {
        let input = "))("
        XCTAssertEqual(day.run(input: input), "-1")
    }
    
    func testDay8() throws {
        let input = ")))"
        XCTAssertEqual(day.run(input: input), "-3")
    }
    
    func testDay9() throws {
        let input = ")())())"
        XCTAssertEqual(day.run(input: input), "-3")
    }
}
