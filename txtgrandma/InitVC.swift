//
//  ViewController.swift
//  txtgrandma
//
//  Created by Rob Norback on 6/17/16.
//  Copyright © 2016 Sidecar Games. All rights reserved.
//

import UIKit

class InitVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startTextButtonPressed(sender: AnyObject) {
        let timer = NSTimer.scheduledTimerWithTimeInterval(20, target: self, selector: #selector(InitVC.sendLocalNotification), userInfo: nil, repeats: true)
    }
    
    func sendLocalNotification() {
        if let phoneNumber = phoneTextField.text {
            GrandmaWeb.sendTextTo(phoneNumber, completion: {
                print("sent text")
                }, errorBlock: { (error) in
                    print("error")
            })
        }
    }
    
    
    
    

}

