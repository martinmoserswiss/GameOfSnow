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
        
        var frame: CGRect = UIScreen.mainScreen().bounds
        
        self.view.addSubview(getTitleLabel(frame))
        self.view.addSubview(getButton(frame))
        self.view.addSubview(getResultLabel(frame))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getTitleLabel (frame: CGRect) -> UILabel {
        let titleLabel = UILabel(frame: CGRectMake(50,50, frame.size.width-100, 50))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.backgroundColor = UIColor.blackColor()
        titleLabel.text = "Game of SNOW"
        return titleLabel
    }
    
    func getButton (frame: CGRect) -> UIButton {
        let button = UIButton(frame: CGRectMake(frame.size.width/2-50, frame.size.height/2-50, 100, 100))
        button.backgroundColor = UIColor.brownColor()
        button.setTitle("Würfeln", forState: UIControlState.Normal)
        button.addTarget(self, action: "didTouchButton:", forControlEvents: .TouchUpInside)
        return button
    }
    
    func didTouchButton(sender: UIButton!) {
        if resultLabel.text == "Ou yeah yeah yeah yeah!!!" {
            resultLabel.text = "... würfle dein Trick!"
        } else {
            resultLabel.text = "Ou yeah yeah yeah yeah!!!"
        }
    }
    
    func getResultLabel (frame:CGRect) -> UILabel {
        resultLabel = UILabel(frame: CGRectMake(50,frame.size.height-150, frame.size.width-100, 50))
        resultLabel.textColor = UIColor.whiteColor()
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.backgroundColor = UIColor.blackColor()
        resultLabel.text = "... würfle dein Trick!"
        return resultLabel
    }
}

