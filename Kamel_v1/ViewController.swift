//
//  ViewController.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func profileTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    @IBAction func newListingTapped(_ sender: Any) {
        // TODO: check if loggedin
        if(UserDefaults.standard.bool(forKey: "isUserLoggedIn")){
            performSegue(withIdentifier: "newListing", sender: self)
        } else {
        self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
        
    }
    
}

