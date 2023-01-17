//
//  Day16.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day16: Day {
    func run(input: String) -> String {
        let target = (children: 3,
                      cats: 7,
                      samoyeds: 2,
                      pomeranians: 3,
                      akitas: 0,
                      vizslas: 0,
                      goldfish: 5,
                      trees: 3,
                      cars: 2,
                      perfumes: 1)
        
        return input
            .lines
            .filter {
                for match in $0.matches(of: /\ (\w+): (\d+)/) {
                    let value = Int(match.output.2)!
                    switch match.output.1 {
                    case "children":
                        if value != target.children {
                            return false
                        }
                    case "cats":
                        if value != target.cats {
                            return false
                        }
                    case "samoyeds":
                        if value != target.samoyeds {
                            return false
                        }
                    case "pomeranians":
                        if value != target.pomeranians {
                            return false
                        }
                    case "akitas":
                        if value != target.akitas {
                            return false
                        }
                    case "vizslas":
                        if value != target.vizslas {
                            return false
                        }
                    case "goldfish":
                        if value != target.goldfish {
                            return false
                        }
                    case "trees":
                        if value != target.trees {
                            return false
                        }
                    case "cars":
                        if value != target.cars {
                            return false
                        }
                    case "perfumes":
                        if value != target.perfumes {
                            return false
                        }
                    default: fatalError("Unknown match: \(match) in \($0)")
                    }
                }
                
                return true
            }
            .first!
            .allDigits[0]
            .description
    }
}
