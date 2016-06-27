//
//  SettingsViewController.swift
//  GameOfSnow
//
//  Created by Martin Moser on 27.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOkButton()
    }
    
    func setupOkButton() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Compose,
            target: self, action: #selector(SettingsViewController.didTouchOkButton(_:)))
        self.navigationItem.rightBarButtonItem = button;
    }
    
    func didTouchOkButton(sender: UIButton) {
        print("Hello, world");
    }
}
