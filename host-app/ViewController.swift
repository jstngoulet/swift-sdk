//
//  ViewController.swift
//  host-app
//
//  Created by Tapash Majumder on 6/27/18.
//  Copyright © 2018 Iterable. All rights reserved.
//

import UIKit

@testable import IterableSDK

class ViewController: UIViewController {
    @IBOutlet weak var statusLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSystemNotificationTap(_ sender: UIButton) {
        ITBInfo()
        
        IterableAPI.showSystemNotification(withTitle: "Zee Title", body: "Zee Body", buttonLeft: "Left Button", buttonRight: "Right Button") { (str) in
            self.statusLbl.text = str
        }
    }
    
    @IBAction func showInAppTap(_ sender: UIButton) {
        ITBInfo()
        
        let html = """
            <a href="http://website/resource#something">Click Me</a>
        """
        IterableInAppManager.showIterableNotificationHTML(html) { (str) in
            ITBInfo("callback: \(str ?? "<nil>")")
            self.statusLbl.text = str
        }
        
        IterableInAppManager.showIterableNotificationHTML(html, callbackBlock: {str in print("callback: ", str ?? "nil")})
    }
}

