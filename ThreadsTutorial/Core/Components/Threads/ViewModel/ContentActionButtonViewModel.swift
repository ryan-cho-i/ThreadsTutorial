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
    
    func likeThread() {
        self.thread.didLike = true
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
