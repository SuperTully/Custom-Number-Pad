//
//  ViewController.swift
//  Custom Number Pad
//
//  Created by Nathanael Tullis on 12/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    let customNumberPad = CustomNumberPad()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add a single touch gesture to be able to resign the number pad
        let singleTouch = UITapGestureRecognizer(target: self, action: #selector(resignDecimalPad))
        view.addGestureRecognizer(singleTouch)
        
        //Add a tool bar with a done button for resigning the number pad
        let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignDecimalPad))
        bar.setItems([.flexibleSpace(), .flexibleSpace(), done], animated: true)
        bar.sizeToFit()
        
        textField.inputView = customNumberPad.inputView
        textField.inputAccessoryView = bar
        textField.autocorrectionType = .no
        
        //Blank out the input assistant item buttons to remove the shortcut bar automatically; I remove this bar because we don't need it with a number pad and it otherwise leads to constraint errors
        let inputAssistantItem = textField.inputAssistantItem
        inputAssistantItem.leadingBarButtonGroups = []
        inputAssistantItem.trailingBarButtonGroups = []
        textField.placeholder = "Enter a Value"
        
    }
    
    @objc func resignDecimalPad() {
        view.endEditing(true)
    }


}

