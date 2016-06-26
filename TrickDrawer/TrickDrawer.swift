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
    
    init() {
        tricks = ["Bs 720 Mute","Bs 360 Mute","Bs 180 Mute","Fs 180 Melon","Fs 360 Indy","Fs 540 Tail","Bs 540 Nose","Fs 720 Tail"]
    }
    
    func drawTrick() -> String {
        return tricks[RandomUtil.getRandomInt(tricks.count)]
    }
}