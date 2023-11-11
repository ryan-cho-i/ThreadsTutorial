//
//  LoginViewModel.swift
//  ThreadsTutorial
//
//  Created by soo on 11/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login (  ) async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
