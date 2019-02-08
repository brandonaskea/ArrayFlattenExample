//
//  AFEArrayFlattener.swift
//  ArrayFlattenExample
//
//  Created by Brandon Askea on 2/7/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import Foundation

struct AFEArrayFlattener {
    
    public func flatten(array: [Any]) -> [Int] {
        let validated = validate(array: array)
        let flattened = validated.flatMap { $0 }
        return flattened
    }
    
    private func validate(array: [Any]) -> [[Int]] {
        var result:[[Int]] = []
        for i in array {
            if let integer = i as? Int {
                result.append(integer.array())
            }
            else if let nestArray = i as? [Int] {
                result.append(nestArray)
            }
            else {
                continue
            }
        }
        return result
    }
    
}
