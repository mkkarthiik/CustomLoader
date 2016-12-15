//
//  ViewController.swift
//  MyCustomLoader
//
//  Created by karthikAdaptavant on 12/15/2016.
//  Copyright (c) 2016 karthikAdaptavant. All rights reserved.
//

import UIKit
import MyCustomLoader


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = CustomLoader.getLoader(target: self)
        
        self.view.addSubview(loader)
    }
}

