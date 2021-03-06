//
//  LoghinViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit
import Firebase

class LoghinViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func login(sender: UIButton) {
        
        // Validate the input
        guard let emailAddress = emailTextField.text, emailAddress != "", let password = passwordTextField.text, password != "" else {
            
            let alertController = UIAlertController(title: "Login Error", message: "Both  fields must not be blank", preferredStyle: .alert
            )
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // perform login by Calling firebase APIS
        Auth.auth().signIn(withEmail: emailAddress, password: password, completion: {(result, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
                }
            
            // emailverification
            guard let result = result, result.user.isEmailVerified else {
                let alertController = UIAlertController(title: "Login Error", message: "You hanven't confirmed your email address yet, We sent you a confirmation email when you sign up, Please click th e verification link in that email. If you need us to send the confirmation email again, please tap resend Email", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Resend Email", style: .default, handler: { (action) in
                    
                    Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                })
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            // Dismiss keyboard
            self.view.endEditing(true)
            
            // present the main view
            if let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
                UIApplication.shared.keyWindow?.rootViewController = viewcontroller
                self.dismiss(animated: true, completion: nil)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Log In"
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
