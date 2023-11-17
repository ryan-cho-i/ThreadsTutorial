//
//  ThreadReply.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadReply: Identifiable, Codable {
    
    @DocumentID var replyId: String?
    let threadId: String
    let replyText: String
    let threadReplyOwnerUid: String
    let threadOwnerUid: String
    let timestamp: Timestamp
    
    var thread: Thread?
    var replyUser: User?
    
    var id: String {
        return replyId ?? NSUUID().uuidString
    }
}
