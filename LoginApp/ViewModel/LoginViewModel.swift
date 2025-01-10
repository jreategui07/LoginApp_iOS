//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Jonathan Reátegui on 2025-01-10.
//

class LoginViewModel {
    private let sessionManager: SessionManager

    init(sessionManager: SessionManager = SessionManager()) {
        self.sessionManager = sessionManager
        configureInitialState()
    }
    
    private func configureInitialState() {
        if let session = loadSession() {
            print("Session loaded: \(session)")
        } else {
            print("There is no session saved")
        }
    }

    func loadSession() -> (username: String?, password: String?, rememberMe: Bool)? {
        return sessionManager.loadSession()
    }

    func getSavedUsername() -> String? {
        return loadSession()?.username
    }
    
    func getSavedPassword() -> String? {
        return loadSession()?.password
    }

    func getRememberMe() -> Bool {
        return loadSession()?.rememberMe ?? false
    }
    
    func login(username: String, password: String, rememberMe: Bool, completion: @escaping (Bool, String?) -> Void) {
        if isValidLogin(username: username, password: password) {
            if rememberMe {
                sessionManager.saveSession(
                    username: username,
                    password: password,
                    rememberMe: rememberMe
                )
            } else {
                sessionManager.removeSession()
            }
            completion(true, nil)
        } else {
            completion(false, "Your username or password is incorrect. Please, try again.")
        }
    }
    
    private func isValidLogin(username: String, password: String) -> Bool {
        // This is just for demonstration, in a real-life project we usually request an API
        return username == "Admin" && password == "123456789"
    }
}
