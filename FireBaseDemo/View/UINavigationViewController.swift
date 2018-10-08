//
//  UINavigationViewController.swift
//  FireBaseDemo
//
//  Created by Dr. BingBing on 2018/10/5.
//  Copyright © 2018 Dr. BingBing. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the navigation bar transparent
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = UIColor.white
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Kailasa-Bold", size: 20)!,
                                                  NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}
