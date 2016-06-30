//
//  DrawViewController.swift
//  snow
//
//  Created by Martin Moser on 20.06.16.
//  Copyright (c) 2016 martinmoser. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    
    var resultLabel : UILabel!;
    var drawer : TrickDrawer!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame: CGRect = UIScreen.mainScreen().bounds
    
        self.view.addSubview(getButton(frame))
        self.view.addSubview(getResultLabel(frame))
        self.setupDoneButton()
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
        button.addTarget(self, action: #selector(DrawViewController.didTouchButton(_:)), forControlEvents: .TouchUpInside)
        return button
    }
    
    func didTouchButton(sender: UIButton!) {
        drawer = TrickDrawer()
        resultLabel.text = drawer.drawTrick()
        resultLabel.hidden = false
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
    
    func setupDoneButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Edit,
            target: self, action: #selector(DrawViewController.didTouchDoneButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
        
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor(netHex:0x1c85c1)
        bar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    func didTouchDoneButton(sender: UIButton) {
        print("Hello, world");
        let ttvc = TricksTableViewController()
        self.navigationController?.viewControllers.append(ttvc)
    }
}

