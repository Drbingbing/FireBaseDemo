//
//  ResetPaaswordViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit

class ResetPaaswordViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Forgot Password"
        
        emailTextField.becomeFirstResponder()
    }

}
