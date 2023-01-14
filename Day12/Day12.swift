//
//  Day12.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day12: Day {
    func run(input: String) -> String {
        let json = try! JSONSerialization.jsonObject(with: input.data(using: .utf8)!)
        return parse(json: json).description
    }
    
    func parse(json: Any) -> Int {
        if let array = json as? [Any] {
            return array.map { parse(json: $0) }.sum
        } else if let dict = json as? [String: Any] {
            if dict.contains(where: { ($0.value as? String) == "red" }) {
                return 0
            }
            return dict.map { parse(json: $0.value) }.sum
        } else if let number = json as? Int {
            return number
        } else if let _ = json as? String {
            return 0
        } else {
            fatalError("Unknown json type: \(json)")
        }
    }
}
