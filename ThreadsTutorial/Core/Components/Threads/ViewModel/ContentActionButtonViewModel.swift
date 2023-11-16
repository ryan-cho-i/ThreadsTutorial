//
//  ContentActionButtonViewModel.swift
//  ThreadsTutorial
//
//  Created by soo on 11/16/23.
//

import Foundation

@MainActor
class ContentActionButtonViewModel: ObservableObject {
    
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfUSerLikedThread() }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUSerLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikeThread(thread)
        
        // only exectue update if thread has been liked
        if didLike {
            self.thread.didLike = true
        }
    }
}
