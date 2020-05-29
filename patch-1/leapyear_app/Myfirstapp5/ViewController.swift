//
//  ViewController.swift
//  Myfirstapp5
//
//  Created by MACUser on 2020/04/12.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tapHandler(_ sender: UIButton) {
        let n = Int(myTextField.text!)
        if n!%4 == 0 && !(n!%100 == 0 && n!%400 != 0) {
            mylabel.text = "\(n!) is leapyear";
        } else {
            mylabel.text = "\(n!) is not leapyear";
        }
    }
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
