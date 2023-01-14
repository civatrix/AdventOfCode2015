//
//  Day12Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    func testDay() throws {
        let input = "[1,2,3]"
        XCTAssertEqual(day.run(input: input), "6")
    }
    
    func testDay2() throws {
        let input = #"{"a":2,"b":4}"#
        XCTAssertEqual(day.run(input: input), "6")
    }
    
    func testDay3() throws {
        let input = "[[[3]]]"
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay4() throws {
        let input = #"{"a":{"b":4},"c":-1}"#
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay5() throws {
        let input = #"{"a":[-1,1]}"#
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay6() throws {
        let input = #"[-1,{"a":1}]"#
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay7() throws {
        let input = "[1,2,3]"
        XCTAssertEqual(day.run(input: input), "6")
    }
}
