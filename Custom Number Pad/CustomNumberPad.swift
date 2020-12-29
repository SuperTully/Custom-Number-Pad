//
//  CustomNumberPad.swift
//  Custom Number Pad
//
//  Created by Nathanael Tullis on 12/28/20.
//

import UIKit

class CustomNumberPad: UIInputViewController {
    
    //Link this view to the XIB's file owner
    @IBOutlet var numberPad: UIView!
    
    //One action for all text insertion buttons
    @IBAction func insertText(_ sender: UIButton) {
        if let text = sender.currentTitle {
            self.textDocumentProxy.insertText(text)
        }
    }
    
    @IBAction func backSpace(_ sender: UIButton) {
        self.textDocumentProxy.deleteBackward()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Bundle.main.loadNibNamed("CustomNumberPad", owner: self)
        numberPad.translatesAutoresizingMaskIntoConstraints = false
        
        let inputView = self.inputView!
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.addSubview(numberPad)
        
        NSLayoutConstraint.activate([
            numberPad.topAnchor.constraint(equalTo: inputView.topAnchor),
            numberPad.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            numberPad.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            numberPad.trailingAnchor.constraint(equalTo: inputView.trailingAnchor)
        ])
    }
}
