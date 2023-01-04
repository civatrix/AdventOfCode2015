//
//  Day4.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import Crypto

final class Day4: Day {
    func run(input: String) -> String {
        for index in 0 ... .max {
            let key = "\(input.trimmingCharacters(in: .newlines))\(index)"
            let hash = Crypto.Insecure.MD5.hash(data: key.data(using: .utf8)!).description
            if hash.split(separator: " ").last!.prefix(5) == "00000" {
                return index.description
            }
        }
        
        return "not found"
    }
}
