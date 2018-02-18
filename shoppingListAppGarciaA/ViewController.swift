//
//  ViewController.swift
//  shoppingListAppGarciaA
//
//  Created by Adrian Garcia on 2/17/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        listLabel.text = "No Item"
    }
    
    @IBAction func newItem(_ sender: UIButton) {
        for tf in textFields{
            tf.text = ""
        }
    }
    
//    let labels = [
//        "Description",
//        "Quantity"
//    ]
    
    @IBAction func addItem(_ sender: UIButton) {
        if listLabel.text == "No Item"{
            listLabel.text = ""
        }
        var items : [Int:String] = [:]
        for tf in textFields{
            tf.resignFirstResponder()
            
            if let tfText = tf.text{
               items[tf.tag] = tfText
            }
            
            if tf.text == ""{
                let alertController = UIAlertController(title: "Error", message: "Invalid Item", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        for(key) in items.keys{
            if let value = items[key]{
                listLabel.text = (listLabel.text ?? "") + "\(value)\n" 
            }
        }
        
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields{
            tf.resignFirstResponder()
        }
    }
    
    
    
    
}

