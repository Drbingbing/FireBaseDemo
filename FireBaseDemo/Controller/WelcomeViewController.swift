//
//  WelcomeViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class WelcomeViewController: UIViewController {
    
    // handling Facebook login
    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManger = FBSDKLoginManager()
        fbLoginManger.logIn(withReadPermissions: ["public_profile", "email"], from: self, handler: { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accesstoken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accesstoken.tokenString)
            
            // perform login by calling firebase APIS
            Auth.auth().signInAndRetrieveData(with: credential, completion: { (result, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    // present the main view
                    if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView"){
                        UIApplication.shared.keyWindow?.rootViewController = viewController
                        
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            })
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindtoWelcomeView(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}
