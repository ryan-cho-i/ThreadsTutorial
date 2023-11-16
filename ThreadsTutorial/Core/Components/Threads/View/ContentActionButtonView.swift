//
//  ContentActionButtonView.swift
//  ThreadsTutorial
//
//  Created by soo on 11/16/23.
//

import SwiftUI

struct ContentActionButtonView: View {
    
    @ObservedObject var viewModel: ContentActionButtonViewModel

    init (thread: Thread) {
        self.viewModel = ContentActionButtonViewModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    private var thread: Thread {
        return viewModel.thread
    }
    
    func handleLikeTapped () {
        Task {
            if didLike {
                try await viewModel.unlikeThread()
            } else {
                try await viewModel.likeThread()
            }
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundColor(didLike ? .red : .black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            
            if thread.likes > 0 {
                Text("\(thread.likes) likes")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical, 4)
            }
        }
    }
}

struct ContentActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentActionButtonView(thread: dev.thread)
    }
}
