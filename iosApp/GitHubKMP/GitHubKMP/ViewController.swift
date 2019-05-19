//
//  ViewController.swift
//  GitHubKMP
//
//  Created by Daniel Reyes Sánchez on 5/5/19.
//  Copyright © 2019 Robert Bosch. All rights reserved.
//

import UIKit
import shared

class ViewController: UIViewController, MembersView {
    
    lazy var dataRepository = MembersDataRepository(api: GithubApi())
    
    lazy var presenter: MembersPresenter = MembersPresenter(view: self, repository: self.dataRepository)


    @IBOutlet weak var platformLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        platformLabel.text = Greeting().greeting()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.onCreate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.onDestroy()
    }

    
    var isUpdating: Bool = false
    
    func onUpdate(members: String) {
        print(members)
    }


}

