//
//  Day15.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day15: Day {
    struct Ingredient {
        static func +(_ lhs: Ingredient, _ rhs: Ingredient) -> Ingredient {
            return .init(capacity: lhs.capacity + rhs.capacity, durability: lhs.durability + rhs.durability, flavour: lhs.flavour + rhs.flavour, texture: lhs.texture + rhs.texture)
        }
        
        static func *(_ lhs: Ingredient, _ rhs: Int) -> Ingredient {
            return .init(capacity: lhs.capacity * rhs, durability: lhs.durability * rhs, flavour: lhs.flavour * rhs, texture: lhs.texture *	 rhs)
        }
        
        static let zero = Ingredient(capacity: 0, durability: 0, flavour: 0, texture: 0)
        let capacity, durability, flavour, texture: Int
        var score: Int {
            guard capacity > 0, durability > 0, flavour > 0, texture > 0 else { return 0 }
            return capacity * durability * flavour * texture
        }
    }
    
    func run(input: String) -> String {
        let ingredients = input.lines.map {
            let numbers = $0.allDigits
            return Ingredient(capacity: numbers[0], durability: numbers[1], flavour: numbers[2], texture: numbers[3])
        }
        
        var maxScore = 0
        for counts in mixtures(index: ingredients.count, total: 100) {
            let score = zip(counts, ingredients)
                .map { (count, ingredient) in
                    return ingredient * count
                }
                .reduce(.zero, +)
                .score
            maxScore = max(score, maxScore)
        }
        
        return maxScore.description
    }
    
    func mixtures(index: Int, total: Int) -> [[Int]] {
        let start = index == 1 ? total : 0
        return (start ... total).flatMap { count in
            let remaining = total - count
            if index > 1 {
                var mixes = [[Int]]()
                for mixture in mixtures(index: index - 1, total: remaining) {
                    mixes.append([count] + mixture)
                }
                return mixes
            } else {
                return [[count]]
            }
        }
    }
}
