//
//  Thread.swift
//  ThreadsTutorial
//
//  Created by soo on 11/15/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Hashable, Codable {
    
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int
    
    var didLike: Bool? = false
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
