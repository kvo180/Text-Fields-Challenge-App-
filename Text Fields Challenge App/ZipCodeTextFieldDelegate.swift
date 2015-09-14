//
//  ZipCodeTextFieldDelegate.swift
//  Text Fields Challenge App
//
//  Created by Khoa Vo on 9/11/15.
//  Copyright (c) 2015 AppSynth. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // textField.text is always 1 character short of user input, so create new string newText that takes into account most recent user input character
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string) // this method, as written, creates a new string that replaces the last character (empty) at the end with the character that was just entered into the textField
        println("string is \(string)")
        println("newText is \(newText)")
        println("textField text is \(textField.text)")
        
        return newText.length <= 5
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}