//
//  ProfileViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBAction func logout(sender: UIButton) {
        do {
            try Auth.auth().signOut()
        }catch {
            let alertController = UIAlertController(title: "Logout Error", message: error.localizedDescription, preferredStyle: .alert)
            let okayAction = UIAlertAction(title:"OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        //Present the welcome view
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Profile"
        
        if let currentUser = Auth.auth().currentUser {
            nameLabel.text = currentUser.displayName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
