//
//  Day21.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day21: Day {
    struct Item: ExpressibleByArrayLiteral {
        let cost, damage, armour: Int
        
        init(arrayLiteral elements: Int...) {
            cost = elements[0]
            damage = elements[1]
            armour = elements[2]
        }
    }
    
    struct Character {
        var health: Int
        let damage, armour: Int
        
        init(items: [Item]) {
            health = 100
            damage = items.map { $0.damage }.sum
            armour = items.map { $0.armour }.sum
        }
        
        init(health: Int, damage: Int, armour: Int) {
            self.health = health
            self.damage = damage
            self.armour = armour
        }
        
        mutating func take(damage: Int) {
            health -= max(1, damage - armour)
        }
        
        mutating func beats(_ enemy: Character) -> Bool {
            var boss = enemy
            while true {
                boss.take(damage: damage)
                if boss.health <= 0 {
                    return true
                }
                
                take(damage: boss.damage)
                if health <= 0 {
                    return false
                }
            }
        }
    }
    
    func run(input: String) -> String {
        let numbers = input.allDigits
        var boss = Character(health: numbers[0], damage: numbers[1], armour: numbers[2])
        
        let items: [[Item]] = [
            [[8, 4, 0],
             [10, 5, 0],
             [25, 6, 0],
             [40, 7, 0],
             [74, 8, 0]],
            
            [[0, 0, 0],
             [13, 0, 1],
             [31, 0, 2],
             [53, 0, 3],
             [75, 0, 4],
             [102, 0, 5]],
            
            [[0, 0, 0],
             [0, 0, 0],
             [25, 1, 0],
             [50, 2, 0],
             [100, 3, 0],
             [20, 0, 1],
             [40, 0, 2],
             [80, 0, 3]],
        ]
        
        var bestCost = Int.max
        var bestItems = [Item]()
        for weapon in items[0] {
            for armour in items[1] {
                for rings in items[2].permutations(ofCount: 2) {
                    let items = [weapon, armour, rings[0], rings[1]]
                    let cost = items.map { $0.cost }.sum
                    guard cost < bestCost else { continue }
                    
                    var hero = Character(items: items)
                    if hero.beats(boss) {
                        bestCost = cost
                        bestItems = items
                    }
                }
            }
        }
        
        print(bestItems)
        return bestCost.description
    }
}
