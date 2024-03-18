//
//  AuthViewModel.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 11/03/2024.
//

import Foundation
import SwiftUI


class AuthViewModel : ObservableObject {
    
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    
    @Published var registerUser : Bool = false
    @Published var isLoading: Bool = false
    
    @AppStorage("Log_Status") var Log_Status : Bool = false

    func rest() {
      email = ""
      password = ""
      phone = ""
      name = ""
  }
  
    
    func SignUp() {
        isLoading = true
        guard validate() else{
            return
        }
        AuthenticationManager.shared.signUp(name: name, phone: phone, email: email, password: password) { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let userData):
                UserDefaultManager.shared.saveUser(userData)
                withAnimation {
                    self.Log_Status = true
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
        }
        
    }
    
    func LogIn() {
        isLoading = true
        guard validate() else{
            return
        }
        AuthenticationManager.shared.logIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let userData):
                UserDefaultManager.shared.saveUser(userData)
                withAnimation {
                    self.Log_Status = true
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        if registerUser {
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                
                showAlert = true
                errorMessage = "Please fill in all field"
                isLoading = false
                return false
            }
            guard isValidEmail(email) else {
                errorMessage = "Email should contain @gmail.com and contain numbers]"
                showAlert = true
                isLoading = false
                return false
            }
            guard password.count >= 8 else {
                errorMessage = "Password should contain 8 carachters"
                showAlert = true
                isLoading = false
                return false
            }
        }else{
            
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                  !phone.trimmingCharacters(in: .whitespaces).isEmpty,
                  !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                
                showAlert = true
                errorMessage = "Please fill in all field"
                isLoading = false
                return false
            }
            guard isValidEmail(email) else {
                errorMessage = "Email should contain @gmail.com and contain numbers]"
                showAlert = true
                isLoading = false
                return false
            }
            guard phone.count >= 11 else {
                errorMessage = "phone should contain 11 carachters"
                showAlert = true
                isLoading = false
                return false
            }
            guard password.count >= 8 else {
                errorMessage = "Password should contain 8 carachters"
                showAlert = true
                isLoading = false
                return false
            }
        }
        errorMessage = ""
        return true
        
    }
    
    
}
