//
//  MembersList.swift
//  GitHubKMP
//
//  Created by Daniel Reyes Sánchez on 5/20/19.
//  Copyright © 2019 Robert Bosch. All rights reserved.
//

import Foundation
import shared

class MembersList {
    var members: [Member] = []
    
    func updateMembers(_ newMembers: [Member]) {
        members.removeAll()
        members.append(contentsOf: newMembers)
    }
    
    
}
