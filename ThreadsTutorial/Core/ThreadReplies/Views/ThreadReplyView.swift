//
//  ThreadReplyView.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import SwiftUI

struct ThreadReplyView: View {
    
    let thread: Thread
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    @Environment(\.dismiss) var dismiss
    
    private var currentUser: User?{
        return UserService.shared.currentUser
    }
    
    func setThreadViewHeight () {
        
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        
        let caption = thread.caption.heightWithConstrainedWidth(width, font: font)
                
        threadViewHeight = caption + imageDimension - 16
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack(alignment: .leading, spacing: 12, content: {
                    HStack (alignment: .top) {
                        VStack {
                            CircularProfileImageView (user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                        VStack (alignment: .leading, spacing: 2) {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    HStack (alignment: .top) {
                        CircularProfileImageView (user: currentUser, size: .small)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                    }
                })
                .padding()
                               
                Spacer()
            }
            .onAppear{ setThreadViewHeight() }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar  {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button ("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button ("Post") {
                        Task {
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}
