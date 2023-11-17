//
//  ThreadReplyProfileCell.swift
//  ThreadsTutorial
//
//  Created by soo on 11/17/23.
//

import SwiftUI

struct ThreadReplyProfileCell: View {
    
    let reply: ThreadReply
    
    var body: some View {
        VStack (alignment: .leading) {
            if let thread = reply.thread {
                
                // thread view
                HStack (alignment: .top) {
                    VStack {
                        CircularProfileImageView(user: thread.user, size:  .small)
                        
                        Rectangle()
                            .frame(width: 2, height: 32)
                            .foregroundStyle(Color(.systemGray4))
                    }
                    
                    VStack(alignment: .leading, spacing: 12, content: {
                        VStack (alignment: .leading, spacing: 12, content: {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            Text(thread.caption)
                        })
                        .font(.footnote)
                        
                        ContentActionButtonView(thread: thread)
                    })
                    
                    Spacer()
                }
            }
            
            HStack(alignment: .top, content: {
                CircularProfileImageView(user: reply.replyUser, size: .small)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(reply.replyUser?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text(reply.replyText)
                })
                .font(.footnote)
            })
            
            Divider()
                .padding(.bottom, 8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ThreadReplyProfileCell(reply: DeveloperPreview.shared.reply)
}
