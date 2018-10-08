//
//  WelcomeViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindtoWelcomeView(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}
