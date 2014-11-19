//
//  DetailViewController.swift
//  Homepwner
//
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialNumberField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    let itemStore: ItemStore
    var item: Item? {
        didSet {
            navigationItem.title = item?.name
        }
    }
    
    init(itemStore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("User init(itemStore:)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // Clear first responder
        view.endEditing(true)
        // "Save" changes to item
        item?.name = nameField.text
        item?.serialNumber = serialNumberField.text
        
        let value = valueField.text.toInt() ?? 0
        println("Value is \(value)")
        
        let v2 = "95".toInt() ?? 0
        println("V2 is \(v2)")
        
        item?.valueInDollars = valueField.text.toInt() ?? 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item?.name
        serialNumberField.text = item?.serialNumber
        valueField.text = "\(item?.valueInDollars ?? 0)"
        
        if let date = item?.dateCreated {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            
            dateLabel.text = dateFormatter.stringFromDate(date)
        }
    }
    
}
