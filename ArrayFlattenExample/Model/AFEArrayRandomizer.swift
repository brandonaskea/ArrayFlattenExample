//
//  AFEArrayRandomizer.swift
//  ArrayFlattenExample
//
//  Created by Brandon Askea on 2/7/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import Foundation

let mod:Int = 5
let randomizerMaximum:Int = 99

struct AFEArrayRandomizer {
    
    public func nestedArray() -> [[Int]] {
        var result:[[Int]] = []
        let numberOfItems = randomInteger()
        for i in 1...numberOfItems {
            if i % mod == 0 {
                result.append(nest())
            }
            else {
                result.append(randomInteger().array())
            }
        }
        return result
    }
    
    private func nest() -> [Int] {
        var result:[Int] = []
        let numberOfItems = randomInteger()
        for _ in 1...numberOfItems {
            result.append(randomInteger())
        }
        return result
    }
    
    private func randomInteger() -> Int {
        var randomInt = getRandomWith(maximum: randomizerMaximum)
        if randomInt == 0 {
            randomInt = randomInteger()
        }
        return randomInt
    }
    
    private func getRandomWith(maximum: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maximum)))
    }
    
}
