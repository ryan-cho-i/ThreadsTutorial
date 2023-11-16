//
//  ContentActionButtonViewModel.swift
//  ThreadsTutorial
//
//  Created by soo on 11/16/23.
//

import Foundation

class ContentActionButtonViewModel: ObservableObject {
    
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
