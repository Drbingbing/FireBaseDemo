//
//  SignUpViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func registerSccount(sender: UIButton) {
        
        // Validate the input
        guard let name = nameTextField.text, name != "", let emailAddress = emailTextField.text, emailAddress != "", let password = passwordTextField.text, password != "" else {
            
            let alertcontroller = UIAlertController(title: "Registration Error", message: "Please make sure you provide your name, email address and password to compelete the registration", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertcontroller.addAction(okayAction)
            present(alertcontroller, animated: true, completion: nil)
            
            return
        }
        
        // register the usr account on firebase
        Auth.auth().createUser(withEmail: emailAddress, password: password, completion: { (user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Registration Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            // save the name of the user
            if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                changeRequest.displayName = name
                changeRequest.commitChanges(completion: { (error) in
                    if let error = error {
                        print("Failed to change the display name :\(error.localizedDescription)")
                    }
                })
            }
            
            // Dismiss keyboard
            self.view.endEditing(true)
            
            // Present the main view
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Sign Up"
        
        nameTextField.becomeFirstResponder()
    }

}
