//
//  ViewController.swift
//  GitHubKMP
//
//  Created by Daniel Reyes Sánchez on 5/5/19.
//  Copyright © 2019 Robert Bosch. All rights reserved.
//

import UIKit
import shared

class ViewController: UIViewController {

    @IBOutlet weak var platformLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        platformLabel.text = Greeting().greeting()
        
    }


}

