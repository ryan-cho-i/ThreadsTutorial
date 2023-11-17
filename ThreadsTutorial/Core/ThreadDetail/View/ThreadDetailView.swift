//
//  ThreadDetailView.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import SwiftUI

struct ThreadDetailView: View {
    
    let thread: Thread
    @StateObject var viewModel: ThreadDetailsViewModel
    
    init(thread: Thread) {
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadDetailsViewModel(thread: thread))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    CircularProfileImageView (user: thread.user, size: .small)
                    
                    Text(thread.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampString())
                        .font(.caption)
                        .foregroundColor(Color(.systemGray3))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                    }
                }
                
                VStack (alignment: .leading, spacing: 12, content: {
                    Text(thread.caption)
                        .font(.subheadline)
                    
                    ContentActionButtonView(thread: thread)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .padding(.vertical)
                
                LazyVStack (spacing: 16) {
                    ForEach(viewModel.replies) { reply in
                        
                        ThreadReplyCell(reply: reply)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    }
}
