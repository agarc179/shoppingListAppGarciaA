//
//  ViewController.swift
//  shoppingListAppGarciaA
//
//  Created by Adrian Garcia on 2/17/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //boolean funtion to check if a String is an Int
    func isInt(string: String) -> Bool{
        return Int(string) != nil
    }

    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listLabel.text = "No Item"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newList(_ sender: UIButton) {
        // reset the list to No Item
        listLabel.text = "No Item"
    }
    
    @IBAction func newItem(_ sender: UIButton) {
        // reset the text fields to empty
        for tf in textFields{
            tf.text = ""
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        var items : [Int:String] = [:]
        for tf in textFields{
            tf.resignFirstResponder()
            
            // if text fields are not empty AND quantity field is an Int add to the dictionary
            if tf.text != "" && isInt(string: textFields[1].text!){
                if let tfText = tf.text{
                    items[tf.tag] = tfText
                }
            }
    
            // if text fields are empty OR quantity field is not an Int send alert
            else if tf.text == "" || isInt(string: textFields[1].text!) == false{
                let alertController = UIAlertController(title: "Error", message: "Invalid Item", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        if listLabel.text == "No Item" && items.count == 2{
            listLabel.text = ""
        }
        
        // if dictionary has 2 items it will add to the listLabel
        if items.count == 2{
            // adds the quantity of items
            if let quantity = items[2]{
                listLabel.text = (listLabel.text ?? "") + "\(quantity)x "
            }
            
            // adds the description of the item
            if let description = items[1]{
                listLabel.text = (listLabel.text ?? "") + "\(description)"
            }
            
            listLabel.text = (listLabel.text ?? "") + "\n" // new line
        }
    }
    
    // when the action button is pressed, the soft keyboard is dismissed
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    // when background is touch, the soft keyboard is dismissed
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields{
            tf.resignFirstResponder()
        }
    }
}

