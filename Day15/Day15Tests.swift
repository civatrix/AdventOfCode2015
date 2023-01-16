//
//  Day15Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day15Tests: XCTestCase {
    let day = Day15()
    
    func testDay() throws {
        let input =
"""
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
"""
        XCTAssertEqual(day.run(input: input), "62842880")
    }
    
    func testMixtures() throws {
        XCTAssertEqual(day.mixtures(index: 2, total: 10).count, 11)
        let mixtures = day.mixtures(index: 3, total: 10)
        XCTAssertTrue(mixtures.allSatisfy { $0.sum == 10 })
        XCTAssertEqual(mixtures.count, 66)
    }
}
