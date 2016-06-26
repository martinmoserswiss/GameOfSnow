//
//  RandomUtil.swift
//  GameOfSnow
//
//  Created by Martin Moser on 26.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import Foundation

class RandomUtil {
    
    static func getRandomInt(range: Int) -> Int {
        return Int(arc4random_uniform(UInt32(range)))
    }
}