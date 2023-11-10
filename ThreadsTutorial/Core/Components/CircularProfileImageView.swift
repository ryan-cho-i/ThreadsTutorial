//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by soo on 11/10/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("lewis-hamilton")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircularProfileImageView()
}
