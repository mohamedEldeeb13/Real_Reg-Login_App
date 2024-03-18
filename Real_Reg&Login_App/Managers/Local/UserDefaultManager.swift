//
//  UserDefaultManager.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 12/03/2024.
//

import Foundation

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    private let userDefaults = UserDefaults.standard
    private let userKey = "userKey"
    
    func saveUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let userData = try encoder.encode(user)
            userDefaults.setValue(userData, forKey: userKey)
        }catch {
            print("Error encoding user: \(error.localizedDescription)")
        }
    }
    
    func getUser() -> User? {
        if let userData = userDefaults.data(forKey: userKey) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: userData)
                return user
            } catch {
                print("Error decoding user: \(error.localizedDescription)")
            }
        }
        return nil
    }
    func deleteUser() {
        userDefaults.removeObject(forKey: userKey)
    }
}
