//
//  CashTextFieldDelegate.swift
//  Text Fields Challenge App
//
//  Created by Khoa Vo on 9/11/15.
//  Copyright (c) 2015 AppSynth. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Create new string newText that takes into account most recent character entered
        var text = textField.text as NSString
        println("text is \(text)")
        var newText = text.stringByReplacingCharactersInRange(range, withString: string)
        println("newText is \(newText)")
        
        // Since textField already contains "$0.00" when empty, loop through newText to check if character is a digit, then append to cashText
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var cashText = ""
        for character in newText.unicodeScalars {
            if digits.longCharacterIsMember(character.value) {
                cashText.append(character)
            }
        }
        
        println("cashText is \(cashText)")
        
        // Check if cashText Int exists, then format and assemble output text
        if let numOfPennies = cashText.toInt() {
            
            println("numOfPennies is \(numOfPennies)")
            
            // Format cents
            var cents = numOfPennies % 100
            var centString:String = String(cents)
            if cents < 10 {
                centString = "0" + "\(centString)"
            } else {
                centString = "\(numOfPennies % 100)"
            }
            
            // Format dollars
            var dollars = numOfPennies/100
            var formatter = NSNumberFormatter()
            formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            var dollarString:String = formatter.stringFromNumber(dollars)! // format dollars to include commas
            
            
            // Assemble output text and display in textField
            var output:String = "$" + "\(dollarString)" + "." + "\(centString)"
            println("Output is \(output)")
            textField.text = output

        } else {
            
            newText = "$0.00"
        }
        
        // Since textField output is managed by code above, this function should return false
        return false
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}