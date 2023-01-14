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
        let input = #"[1,{"c":"red","b":2},3]"#
        XCTAssertEqual(day.run(input: input), "4")
    }
    
    func testDay3() throws {
        let input = #"{"d":"red","e":[1,2,3,4],"f":5}"#
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay4() throws {
        let input = #"[1,"red",5]"#
        XCTAssertEqual(day.run(input: input), "6")
    }
}
