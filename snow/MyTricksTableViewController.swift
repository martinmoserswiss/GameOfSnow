//
//  TricksTableViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 30.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class MyTricksTableViewController: UITableViewController {
    
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
    
    override func viewDidAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Trick")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            tricks = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }
    
    func setupAddButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Add,
            target: self, action: #selector(didTouchAddButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
    }
    
    func didTouchAddButton(sender: UIButton) {
        let attv = AddEditTrickTableViewController()
        self.navigationController?.viewControllers.append(attv)
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
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let edit = UITableViewRowAction(style: .Normal, title: "Ändern") { action, index in
            self.editTrick(index)
        }
        edit.backgroundColor = UIColor.orangeColor()
        
        let delete = UITableViewRowAction(style: .Normal, title: "Löschen") {action, index in
            self.deleteTrick(index)
        }
        delete.backgroundColor = UIColor.redColor()
        
        return [delete, edit]
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func deleteTrick(indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let trick = self.tricks[indexPath.row]
        managedContext.deleteObject(trick)
        tricks.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func editTrick(indexPath: NSIndexPath) {
        let attv = AddEditTrickTableViewController()
        attv.trickToEdit = tricks[indexPath.row];
        self.navigationController?.viewControllers.append(attv)
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
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
