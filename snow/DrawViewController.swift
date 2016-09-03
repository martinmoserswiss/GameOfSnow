//
//  DrawViewController.swift
//  snow
//
//  Created by Martin Moser on 20.06.16.
//  Copyright (c) 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class DrawViewController: UIViewController {
    
    var resultLabel : UILabel!;
    var drawer : TrickDrawer!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame: CGRect = UIScreen.mainScreen().bounds
    
        self.view.addSubview(getProgressWord(frame))
        self.view.addSubview(getButton(frame))
        self.view.addSubview(getResultLabel(frame))
        self.view.addSubview(getBailedButton(frame))
        self.view.addSubview(getStompedButton(frame))
        self.setupDoneButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getProgressWord (frame:CGRect) -> UILabel {
        let progressWordLabel = UILabel(frame: CGRectMake(0,50, frame.size.width, 125))
        progressWordLabel.textColor = UIColor.blackColor()
        progressWordLabel.textAlignment = NSTextAlignment.Center
        //progressWordLabel.backgroundColor = UIColor(netHex: 0x7F898F)
        progressWordLabel.text = "S.N.O.W"
        progressWordLabel.hidden = false
        progressWordLabel.font = UIFont(name: progressWordLabel.font.fontName, size: 40)
        progressWordLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return progressWordLabel
    }
    
    func getButton (frame: CGRect) -> UIButton {
        let drawButton = UIButton(frame: CGRectMake(frame.size.width/2-100, frame.size.height/2-170, 200, 200))
        drawButton.backgroundColor = UIColor(netHex: 0xFFA906)
        drawButton.layer.cornerRadius = 0.5 * drawButton.bounds.size.width
        drawButton.setTitle(NSLocalizedString("DrawViewController.DrawButton", comment: ""), forState: UIControlState.Normal)
        drawButton.titleLabel!.font =  UIFont(name: (drawButton.titleLabel!.font?.fontName)!, size: 55)
        drawButton.addTarget(self, action: #selector(DrawViewController.didTouchButton(_:)), forControlEvents: .TouchUpInside)
        return drawButton
    }
    
    func getResultLabel (frame:CGRect) -> UILabel {
        resultLabel = UILabel(frame: CGRectMake(0,frame.size.height-250, frame.size.width, 125))
        resultLabel.textColor = UIColor.whiteColor()
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.backgroundColor = UIColor(netHex: 0x7F898F)
        resultLabel.text = ""
        resultLabel.hidden = true
        resultLabel.font = UIFont(name: resultLabel.font.fontName, size: 40)
        resultLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        resultLabel.numberOfLines = 3
        return resultLabel
    }
    
    func getBailedButton (frame: CGRect) -> UIButton {
        let bailedButton = UIButton(frame: CGRectMake(frame.size.width/5, frame.size.height/2+240, 70, 70))
        bailedButton.backgroundColor = UIColor.redColor()
        bailedButton.layer.cornerRadius = 0.5 * bailedButton.bounds.size.width
        bailedButton.setTitle(NSLocalizedString("DrawViewController.bailedButton", comment: ""), forState: UIControlState.Normal)
        bailedButton.titleLabel!.font =  UIFont(name: (bailedButton.titleLabel!.font?.fontName)!, size: 45)
        bailedButton.addTarget(self, action: #selector(DrawViewController.didTouchButton(_:)), forControlEvents: .TouchUpInside)
        return bailedButton
        
        //"DrawViewController.stompedButton"="✓"
    }
    
    func getStompedButton (frame: CGRect) -> UIButton {
        let stompedButton = UIButton(frame: CGRectMake(frame.size.width/5*3, frame.size.height/2+240, 70, 70))
        stompedButton.backgroundColor = UIColor(netHex:0x009900)
        stompedButton.layer.cornerRadius = 0.5 * stompedButton.bounds.size.width
        stompedButton.setTitle(NSLocalizedString("DrawViewController.stompedButton", comment: ""), forState: UIControlState.Normal)
        stompedButton.titleLabel!.font =  UIFont(name: (stompedButton.titleLabel!.font?.fontName)!, size: 45)
        stompedButton.addTarget(self, action: #selector(DrawViewController.didTouchButton(_:)), forControlEvents: .TouchUpInside)
        return stompedButton
    }
    
    func setupDoneButton() {
        
        let button = UIBarButtonItem(
            image: UIImage(named: "Settings"),
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: #selector(DrawViewController.didTouchDoneButton(_:))
        )
        
        self.navigationItem.rightBarButtonItem = button;
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor(netHex:0x1c85c1)
        bar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    func didTouchButton(sender: UIButton!) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Trick")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            var tricks: [String] = []
            
            for managedObject in results as! [NSManagedObject] {
                tricks.append(managedObject.valueForKey("name") as! String)
            }
            
            drawer = TrickDrawer(tricksArgument: tricks)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        resultLabel.text = drawer.drawTrick()
        resultLabel.hidden = false
    }
    
    func didTouchDoneButton(sender: UIButton) {
        let ttvc = MyTricksTableViewController()
        self.navigationController?.viewControllers.append(ttvc)
    }
}

