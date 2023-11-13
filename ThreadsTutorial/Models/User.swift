//
//  User.swift
//  ThreadsTutorial
//
//  Created by soo on 11/11/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    
}
