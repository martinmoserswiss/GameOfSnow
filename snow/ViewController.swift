//
//  ViewController.swift
//  snow
//
//  Created by Martin Moser on 20.06.16.
//  Copyright (c) 2016 martinmoser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel : UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame: CGRect = UIScreen.mainScreen().bounds
    
        self.view.addSubview(getButton(frame))
        self.view.addSubview(getResultLabel(frame))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getButton (frame: CGRect) -> UIButton {
        let button = UIButton(frame: CGRectMake(frame.size.width/2-100, frame.size.height/2-200, 200, 200))
        button.backgroundColor = UIColor(netHex: 0xFFA906)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle("Trick!", forState: UIControlState.Normal)
        button.titleLabel!.font =  UIFont(name: (button.titleLabel!.font?.fontName)!, size: 55)
        button.addTarget(self, action: #selector(ViewController.didTouchButton(_:)), forControlEvents: .TouchUpInside)
        return button
    }
    
    func didTouchButton(sender: UIButton!) {
        if resultLabel.text == "Bs 7 Mute" {
            resultLabel.text = ""
            resultLabel.hidden = true
        } else {
            resultLabel.text = "Bs 7 Mute"
            resultLabel.hidden = false
        }
    }
    
    func getResultLabel (frame:CGRect) -> UILabel {
        resultLabel = UILabel(frame: CGRectMake(0,frame.size.height-250, frame.size.width, 125))
        resultLabel.textColor = UIColor.whiteColor()
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.backgroundColor = UIColor(netHex: 0x7F898F)
        resultLabel.text = ""
        resultLabel.hidden = true
        resultLabel.font = UIFont(name: resultLabel.font.fontName, size: 40)
        return resultLabel
    }
}

