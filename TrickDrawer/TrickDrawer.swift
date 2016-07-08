//
//  File.swift
//  GameOfSnow
//
//  Created by Martin Moser on 24.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import Foundation

class TrickDrawer {
    
    var tricks: [String]
    
    init(tricksArgument: [String]) {
        tricks = tricksArgument
    }
    
    func drawTrick() -> String {
        if tricks.count == 0 {
            return "Erfasse Tricks!"
        }
        return tricks[RandomUtil.getRandomInt(tricks.count)]
    }
}