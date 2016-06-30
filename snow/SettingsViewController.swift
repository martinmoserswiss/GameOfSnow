//
//  SettingsViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 27.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOkButton()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Trick")
        
        do {
            let results =
                try managedContext!.executeFetchRequest(fetchRequest)
            let tricks = results as! [NSManagedObject]
            print("tricks has \(tricks.count) objects...")
            for trick in tricks {
                print("\(trick.valueForKey("name") as? String)!")
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func setupOkButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Compose,
            target: self, action: #selector(SettingsViewController.didTouchOkButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
    }
    
    func didTouchOkButton(sender: UIButton) {
        print("Hello, world");
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Trick", inManagedObjectContext: managedContext!)
        
        let trick = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        trick.setValue("BS 1080 Mute", forKey: "name")
        
        do {
            try managedContext?.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
}
