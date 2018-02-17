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
        listLabel.text = "No item"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newList(_ sender: UIButton) {
        listLabel.text = "No item"
    }
    
    @IBAction func newItem(_ sender: UIButton) {
        
    }
    
    @IBAction func addItem(_ sender: UIButton) {
    }
    
    
}

