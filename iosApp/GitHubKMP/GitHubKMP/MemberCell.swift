//
//  MemberCell.swift
//  GitHubKMP
//
//  Created by Daniel Reyes Sánchez on 5/20/19.
//  Copyright © 2019 Robert Bosch. All rights reserved.
//

import Foundation
import UIKit
import shared

class MemberCell: UITableViewCell {
    
    static let identifier = "MemberCell"
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(username: String, url: String) {
        self.usernameLabel.text = username
        self.profileImageView.load(url: URL(string: url)!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        
        usernameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        usernameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
