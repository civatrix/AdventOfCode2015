//
//  Day11.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day11: Day {
    let a = UnicodeScalar("a").value
    let i = UnicodeScalar("i").value - UnicodeScalar("a").value
    let l = UnicodeScalar("o").value - UnicodeScalar("a").value
    let o = UnicodeScalar("l").value - UnicodeScalar("a").value
    func run(input: String) -> String {
        nextPassword(input: nextPassword(input: input))
    }
    
    func nextPassword(input: String) -> String {
        var characters = input.unicodeScalars.map { $0.value - a }
        
        while true {
            increment(&characters)
            
            var hasTriple = false
            for index in characters.indices.dropLast(2) {
                if characters[index] + 1 == characters[index + 1] && characters[index + 1] + 1 == characters[index + 2] {
                    hasTriple = true
                    break
                }
            }
            guard hasTriple else { continue }
            
            var hasTwoPairs = false
            let pairs = characters.adjacentPairs()
            if let firstPair = pairs.firstIndex(where: { $0.0 == $0.1 }),
               let secondPair = pairs.lastIndex(where: { $0.0 == $0.1 }),
               pairs.distance(from: firstPair, to: secondPair) >= 2 {
                hasTwoPairs = true
            }
            
            if hasTwoPairs {
                break
            }
        }
        
        return String(characters.map { Character(UnicodeScalar($0 + a)!) })
    }
    
    func increment(_ array: inout [UInt32]) {
        array[array.endIndex - 1] += 1
        while let index = array.lastIndex(where: { $0 >= 26 }) {
            array[index] = 0
            array[index - 1] += 1
        }
        
        if let index = array.firstIndex(where: { [i, l, o].contains($0) }) {
            array[index] += 1
            (index + 1 ..< array.endIndex).forEach { array[$0] = 0 }
        }
    }
}
