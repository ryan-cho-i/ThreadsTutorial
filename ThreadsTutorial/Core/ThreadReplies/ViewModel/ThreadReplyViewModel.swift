//
//  ThreadReplyViewModel.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import Foundation
import Firebase

class ThreadReplyViewModel: ObservableObject {
    
    func uploadThreadReply (replyText: String, thread: Thread) async throws {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let reply = ThreadReply(
            threadId: thread.id,
            replyText: replyText,
            threadReplyOwnerUid: uid,
            threadOwnerUid: thread.ownerUid,
            timestamp: Timestamp()
        )
        
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
    }
}
