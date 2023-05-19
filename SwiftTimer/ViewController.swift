//
//  ViewController.swift
//  SwiftTimer
//
//  Created by Marcelo Sampaio on 06/05/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func start(_ sender: Any) {
        print("🌴 start")
        DeviceManager.standard.vibrate()
    }
    
    @IBAction func stop(_ sender: Any) {
        print("🌴 stop")
        DeviceManager.standard.stopVibration()
    }
    
    
    
}

