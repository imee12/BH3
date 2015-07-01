//
//  UsersViewController.swift
//  BearsApp3
//
//  Created by Imee Cuison on 7/1/15.
//  Copyright (c) 2015 Imee Cuison. All rights reserved.
//

import UIKit
import CoreBluetooth

class UsersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
 
    
    }

    
    
    @IBAction func syncBtn_click(sender: AnyObject) {
        
        self.performSegueWithIdentifier("goToFindVC", sender: self)

        
    }
    
    
}
    
    
 