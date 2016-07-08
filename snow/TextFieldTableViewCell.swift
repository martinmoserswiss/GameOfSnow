//
//  TextFieldTableViewCell.swift
//  GameOfSnow
//
//  Created by Martin Moser on 08.07.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    var textField : UITextField!;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setupCell(0.0)
    }
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, margin: CGFloat) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setupCell(margin)
    }
    
    func setupCell(margin: CGFloat) {
        self.setupCell();
        self.setupTextField();
        self.contentView.addSubview(self.textField);
        self.setupTextFieldConstraint(margin);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    func setupCell() {
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = false;
        self.selectionStyle = UITableViewCellSelectionStyle.None;
    }
    
    func setupTextField() {
        self.textField = UITextField();
        self.textField.keyboardType = UIKeyboardType.Default;
    }
    
    func setupTextFieldConstraint(margin: CGFloat) {
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintWidth = NSLayoutConstraint(
            item: self.textField,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.textField.superview,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: -(margin*2)
        )
        
        let constraintHeight = NSLayoutConstraint(
            item: self.textField,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.textField.superview,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0.0
        )
        
        let constraintCenterX = NSLayoutConstraint(
            item: self.textField,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.textField.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0.0
        )
        
        let constraintCenterY = NSLayoutConstraint(
            item: self.textField,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.textField.superview,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0.0
        )
        
        self.textField.superview?.addConstraint(constraintWidth);
        self.textField.superview?.addConstraint(constraintHeight);
        self.textField.superview?.addConstraint(constraintCenterX);
        self.textField.superview?.addConstraint(constraintCenterY);
        
    }

}
