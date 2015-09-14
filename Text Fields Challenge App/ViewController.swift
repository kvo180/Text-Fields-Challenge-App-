//
//  ViewController.swift
//  Text Fields Challenge App
//
//  Created by Khoa Vo on 9/11/15.
//  Copyright (c) 2015 AppSynth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var textFieldEnableSwitch: UISwitch!
    
    // MARK: - Text Field Delegate objects 
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.lockableTextField.delegate = self
        
        // Initialize text field switch to OFF position
        self.textFieldEnableSwitch.setOn(false, animated: false)
    }
    
    // MARK: - Text Field Delegate methods
    // Set text field switch to allow editing
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        return self.textFieldEnableSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        lockableTextField.resignFirstResponder()
        
        return true
    }

    // When text switch is switched to off, stop editing and hide keyboard
    @IBAction func stopEditing(sender: UISwitch) {
        
        if sender.on == false {
            self.lockableTextField.resignFirstResponder()
        }
    }
    
    // close keyboard whenever user taps anywhere outside of keyboard:
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }

}

