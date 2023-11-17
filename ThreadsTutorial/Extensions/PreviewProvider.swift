//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by soo on 11/13/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    let user = User(id:NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1")
    
    lazy var thread = Thread(
        ownerUid: "123",
        caption: "This is a test thread",
        timestamp: Timestamp(),
        likes: 37,
        replyCount: 5
    )
    
    lazy var reply = ThreadReply (
        threadId: "123",
        replyText: "This a preview reply",
        threadReplyOwnerUid: "1254",
        threadOwnerUid: "988832",
        timestamp: Timestamp(),
        thread: thread,
        replyUser: user
    )
}
