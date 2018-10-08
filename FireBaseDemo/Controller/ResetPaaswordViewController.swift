//
//  ResetPaaswordViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit
import Firebase

class ResetPaaswordViewController: UIViewController {
    
    @IBAction func resetPassword(sender: UIButton) {
        
        // Validate the input
        guard let emailAddress = emailTextField.text, emailAddress != "" else {
            let alertController = UIAlertController(title: "Input Error", message: "Please provide your email address for password reset", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Send password reset email
        Auth.auth().sendPasswordReset(withEmail: emailAddress, completion: {(error) in
            
            let title = (error == nil) ? "Password Reset Follow-up" : "Password Reset Error"
            let message = (error == nil) ? "We have just sent you a password reset email. Please check your index box and follow the instructions to reset your password" : error?.localizedDescription
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
                
                if error == nil{
                    // dismiss keyboard
                    self.view.endEditing(true)
                    
                    // return to the login screen
                    if let navcontroller = self.navigationController {
                        navcontroller.popViewController(animated: true)
                    }
                }
            })
            alertController.addAction(okayAction)
            
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Forgot Password"
        
        emailTextField.becomeFirstResponder()
    }

}
