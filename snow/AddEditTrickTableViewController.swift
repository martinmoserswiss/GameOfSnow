//
//  AddTrickTableViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 02.07.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit
import CoreData

class AddEditTrickTableViewController: UITableViewController, UITextFieldDelegate {
    
    internal var trickToEdit: NSManagedObject?;
    private var trickNameTextField: UITextField?;

    convenience init() {
        self.init(style: .Grouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(netHex:0x1c85c1)
        setupDoneButton()
        self.trickNameTextField?.delegate = self
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
            self.trickNameTextField!.placeholder = NSLocalizedString("AddEditTrickTableViewController.TrickNameTextField.Placeholder", comment: "")
            
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
            //Update Trick
            trickToEdit?.setValue(self.trickNameTextField?.text, forKey: "name")
            let dvc = navigationController?.viewControllers[0] as! DrawViewController
            dvc.resultLabel.hidden = true
        } else {
            //Save new Trick!
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
}
