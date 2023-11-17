//
//  ThreadDetailsViewModel.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import Foundation

@MainActor
class ThreadDetailsViewModel: ObservableObject {
    @Published var replies = [ThreadReply] ()
    
    private let thread: Thread
    
    init (thread: Thread) {
        self.thread = thread
        Task { try await fetchThreadReplies() }
    }
    
    private func fetchThreadReplies () async throws {
        self.replies = try await ThreadReplyService.fetchThreadReplies(forThread: thread)
    }
    
    private func fetchUserDataForReplies () async throws {

        for i in 0 ..< replies.count {
            let reply = replies [i]
            
            async let user = UserService.fetchUser(withUid: reply.threadOwnerUid)
            self.replies[i].replyUser = try await user
        }
    }
}
