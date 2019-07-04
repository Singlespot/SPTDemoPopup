//
//  ViewController.swift
//  SPTDemoPopup
//
//  Created by Quentin Beaudouin on 04/07/2019.
//  Copyright © 2019 Singlespot. All rights reserved.
//

import UIKit
import SPTProximityKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startRequestLocationProcessAction(_ sender: Any) {
        SPTProximityManager.requestLocationAuthorizations()
    }
    
    @IBAction func userInputRequestLocation(_ sender: Any) {
        SPTProximityManager.onUserInputRequestAlwaysAuthorization { (status) in
            print("on User Input Request Always Authorization -> status : %d", status)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

