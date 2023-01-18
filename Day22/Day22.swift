//
//  Day22.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day22: Day {
    enum Spell: CaseIterable {
        case missile, drain, shield, poison, recharge
        
        var cost: Int {
            switch self {
            case .missile:
                return 53
            case .drain:
                return 73
            case .shield:
                return 113
            case .poison:
                return 173
            case .recharge:
                return 229
            }
        }
    }
    
    struct Turn {
        init(playerHP: Int, mana: Int, enemyHP: Int, damage: Int, shieldDuration: Int, poisonDuration: Int, rechargeDuration: Int, totalMana: Int) {
            self.playerHP = playerHP
            self.mana = mana
            self.enemyHP = max(enemyHP, 0)
            self.damage = damage
            self.shieldDuration = shieldDuration
            self.poisonDuration = poisonDuration
            self.rechargeDuration = rechargeDuration
            self.totalMana = totalMana
        }
        
        let playerHP, mana, totalMana: Int
        let enemyHP, damage: Int
        let shieldDuration, poisonDuration, rechargeDuration: Int
        
        func enemyTurn() -> Turn? {
            if enemyHP - (poisonDuration > 0 ? 3 : 0) <= 0 {
                return Turn(playerHP: playerHP,
                            mana: mana,
                            enemyHP: 0,
                            damage: damage,
                            shieldDuration: max(shieldDuration - 1, 0),
                            poisonDuration: max(poisonDuration - 1, 0),
                            rechargeDuration: max(rechargeDuration - 1, 0),
                            totalMana: totalMana)
            }
            
            let nextTurn = Turn(playerHP: playerHP - damage + (shieldDuration > 0 ? 7 : 0),
                                mana: mana + (rechargeDuration > 0 ? 101 : 0),
                                enemyHP: enemyHP - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: max(shieldDuration - 1, 0),
                                poisonDuration: max(poisonDuration - 1, 0),
                                rechargeDuration: max(rechargeDuration - 1, 0),
                                totalMana: totalMana)
            
            if nextTurn.playerHP <= 0 {
                return nil
            } else {
                return nextTurn
            }
        }
        
        func nextTurn(casting: Spell) -> Turn? {
            if playerHP == 1 {
                return nil
            }
            if enemyHP - (poisonDuration > 0 ? 3 : 0) <= 0 {
                return Turn(playerHP: playerHP - 1,
                            mana: mana,
                            enemyHP: 0,
                            damage: damage,
                            shieldDuration: max(shieldDuration - 1, 0),
                            poisonDuration: max(poisonDuration - 1, 0),
                            rechargeDuration: max(rechargeDuration - 1, 0),
                            totalMana: totalMana)
            }
            
            let nextMana = mana + (rechargeDuration > 0 ? 101 : 0)
            guard nextMana >= casting.cost else { return nil }
            
            let nextTurn: Turn
            switch casting {
            case .missile:
                nextTurn = Turn(playerHP: playerHP - 1,
                                mana: nextMana - casting.cost,
                                enemyHP: enemyHP - 4 - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: max(shieldDuration - 1, 0),
                                poisonDuration: max(poisonDuration - 1, 0),
                                rechargeDuration: max(rechargeDuration - 1, 0),
                                totalMana: totalMana + casting.cost)
            case .drain:
                nextTurn = Turn(playerHP: playerHP - 1 + 2,
                                mana: nextMana - casting.cost,
                                enemyHP: enemyHP - 2 - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: max(shieldDuration - 1, 0),
                                poisonDuration: max(poisonDuration - 1, 0),
                                rechargeDuration: max(rechargeDuration - 1, 0),
                                totalMana: totalMana + casting.cost)
            case .shield:
                guard shieldDuration <= 1 else { return nil }
                nextTurn = Turn(playerHP: playerHP - 1,
                                mana: nextMana - casting.cost,
                                enemyHP: enemyHP - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: 6,
                                poisonDuration: max(poisonDuration - 1, 0),
                                rechargeDuration: max(rechargeDuration - 1, 0),
                                totalMana: totalMana + casting.cost)
            case .poison:
                guard poisonDuration <= 1 else { return nil }
                nextTurn = Turn(playerHP: playerHP - 1,
                                mana: nextMana - casting.cost,
                                enemyHP: enemyHP - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: max(shieldDuration - 1, 0),
                                poisonDuration: 6,
                                rechargeDuration: max(rechargeDuration - 1, 0),
                                totalMana: totalMana + casting.cost)
            case .recharge:
                guard rechargeDuration <= 1 else { return nil }
                nextTurn = Turn(playerHP: playerHP - 1,
                                mana: nextMana - casting.cost,
                                enemyHP: enemyHP - (poisonDuration > 0 ? 3 : 0),
                                damage: damage,
                                shieldDuration: max(shieldDuration - 1, 0),
                                poisonDuration: max(poisonDuration - 1, 0),
                                rechargeDuration: 5,
                                totalMana: totalMana + casting.cost)
            }
            
            return nextTurn
        }
    }
    
    func run(input: String) -> String {
        let numbers = input.allDigits
        
        var stack = [Turn(playerHP: 50, mana: 500, enemyHP: numbers[0], damage: numbers[1], shieldDuration: 0, poisonDuration: 0, rechargeDuration: 0, totalMana: 0)]
        var best = Int.max
        
        func addToStack(_ new: Turn) {
            guard new.totalMana < best else {
                return
            }
            stack.append(new)
            
            if new.enemyHP == 0 {
                best = new.totalMana
                stack = stack.filter { $0.totalMana < best }
            }
        }
        
        while let next = stack.popLast() {
            Spell.allCases.compactMap {
                guard let afterPlayerTurn = next.nextTurn(casting: $0) else { return nil }
                return afterPlayerTurn.enemyTurn()
            }.forEach { addToStack($0) }
        }
        
            
        return best.description
    }
}
