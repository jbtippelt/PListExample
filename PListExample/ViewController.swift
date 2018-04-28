//
//  ViewController.swift
//  PListExample
//
//  Created by Jakob on 28.04.18.
//  Copyright © 2018 741. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let path = Bundle.main.path(forResource: "data", ofType: "plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
    }
    
    func readData(){
        let url = URL(fileURLWithPath: path!)
        let dict = NSDictionary(contentsOf: url)!
        
        if let text = dict.value(forKey: "text"){
            self.textLabel.text = text as? String ?? ""
        }
    }
    
    func writeData(){
        let url = URL(fileURLWithPath: path!)
        let dict = NSMutableDictionary()
        
        let str = self.textField.text
        
        dict.setValue(str, forKey: "text")
        dict.write(to: url, atomically:  true)
        
        //readData()
    }

    @IBAction func loadText(_ sender: Any) {
        readData()
    }
    
    @IBAction func writeText(_ sender: Any) {
        writeData()
    }
}

