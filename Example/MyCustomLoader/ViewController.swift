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

    lazy var customLoader : CustomLoader = {
     
        let loader = CustomLoader(forView:self.view)
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func startBtnAction(_ sender: Any) {
        
        customLoader.showLoader()
    }
    
    @IBAction func stopBtnAction(_ sender: Any) {
        
        customLoader.hideLoader()
    }
}

