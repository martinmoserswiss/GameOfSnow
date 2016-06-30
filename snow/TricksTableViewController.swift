//
//  TricksTableViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 30.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class TricksTableViewController: UITableViewController {
    
    var tricks = [NSManagedObject]()
    let cellIdentifier = "TricksTableViewCell"
    
    convenience init() {
        self.init(style: .Grouped)
        title = "Deine Tricks"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(netHex:0x1c85c1)
        tableView.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: cellIdentifier)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Trick")
        
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            tricks = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        setupAddButton()
    }
    
    func setupAddButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Add,
            target: self, action: #selector(didTouchAddButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
    }
    
    func didTouchAddButton(sender: UIButton) {
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
        
        tricks.append(trick)
        
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tricks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        let trick = self.tricks[indexPath.row]
        cell.textLabel!.text = trick.valueForKey("name") as? String
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        if editingStyle == .Delete {
            let trick = self.tricks[indexPath.row]
            managedContext.deleteObject(trick)
            tricks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
