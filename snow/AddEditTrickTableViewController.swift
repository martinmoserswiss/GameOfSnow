//
//  AddTrickTableViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 02.07.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class AddEditTrickTableViewController: UITableViewController {
    
    internal var trickToEdit: NSManagedObject?;
    private var trickNameTextField: UITextField?;

    convenience init() {
        self.init(style: .Grouped)
        title = "Neuer Trick"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(netHex:0x1c85c1)
        setupDoneButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier = "AddTrickCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cellIdentifier = "TextFieldTableViewCell";
            let textFieldCell = TextFieldTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier, margin: 15.0);
            self.trickNameTextField = textFieldCell.textField;
            self.trickNameTextField!.placeholder = "Trickname"
            
            if self.trickToEdit != nil {
                self.trickNameTextField!.text = self.trickToEdit?.valueForKey("name") as? String
            }
            
            cell = textFieldCell;
        }

        return cell!
    }
    
    func setupDoneButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Done,
            target: self, action: #selector(didTouchDoneButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
    }
    
    func didTouchDoneButton(sender: UIButton) {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        if trickToEdit != nil {
            print("Update Trick!")
            trickToEdit?.setValue(self.trickNameTextField?.text, forKey: "name")
        } else {
            print("Save new Trick!")
            let entity = NSEntityDescription.entityForName("Trick", inManagedObjectContext: managedContext!)
            let trick = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            trick.setValue(self.trickNameTextField?.text, forKey: "name")
        }

        do {
            try managedContext?.save()
            navigationController?.popViewControllerAnimated(true)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
