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
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let membersList = MembersList()
    
    lazy var dataRepository = MembersDataRepository(api: GithubApi())
    lazy var presenter: MembersPresenter = MembersPresenter(view: self, repository: self.dataRepository)


    @IBOutlet weak var platformLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemberCell.self, forCellReuseIdentifier: MemberCell.identifier)
        
        
        
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
    
    func onUpdate(members: [Member]) {
        print(members)
        self.membersList.updateMembers(members)
        self.tableView.reloadData()
    }


}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data.init(contentsOf: url) {
                if let image = UIImage.init(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.membersList.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemberCell.identifier, for: indexPath) as! MemberCell
        let member = self.membersList.members[indexPath.row]
        cell.configure(username: member.login, url: member.avatarUrl)
        return cell
    }
}

