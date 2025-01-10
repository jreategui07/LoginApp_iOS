//
//  SessionManager.swift
//  LoginApp
//
//  Created by Jonathan Reátegui on 2025-01-10.
//

import Foundation

class SessionManager {
    func saveSession(username: String, password: String?, rememberMe: Bool) {
        // This is just for demonstration, in a real life project we usually save a token
        UserDefaults.standard.set(username, forKey: "savedUsername")
        UserDefaults.standard.set(password, forKey: "savedPassword")
        UserDefaults.standard.set(rememberMe, forKey: "rememberMe")
    }
    
    func removeSession() {
        UserDefaults.standard.removeObject(forKey: "savedUsername")
        UserDefaults.standard.removeObject(forKey: "savedPassword")
        UserDefaults.standard.removeObject(forKey: "rememberMe")
    }
    
    func loadSession() -> (username: String?, password: String?, rememberMe: Bool)? {
        let username = UserDefaults.standard.string(forKey: "savedUsername")
        let password = UserDefaults.standard.string(forKey: "savedPassword")
        let rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")

        if username != nil || password != nil || UserDefaults.standard.object(forKey: "rememberMe") != nil {
            return (username: username, password: password, rememberMe: rememberMe)
        } else {
            return nil
        }
    }
}
