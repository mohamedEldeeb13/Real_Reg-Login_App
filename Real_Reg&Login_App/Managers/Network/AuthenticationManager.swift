//
//  AuthenticationManager.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 12/03/2024.
//

import Foundation


struct LoginRequestBody : Codable {
    let email : String
    let password : String
}

struct SignupRequestBody : Codable {
    let name : String
    let phone : String
    let email : String
    let password : String
}

enum AuthenticationError : Error {
    case invaliedCredentials
    case custom(errorMessage: String)
}

class AuthenticationManager : ObservableObject {
    static let shared = AuthenticationManager()
    /*
    func logIn2(email: String , password: String ) async throws {
        guard let url = URL(string: "https://student.valuxapps.com/api/login") else {
            throw AuthenticationError.custom(errorMessage: "url is wronge")
        }
        let body = LoginRequestBody(email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data , response) = try await URLSession.shared.data(from: url , delegate: nil)
        do {
          request.httpBody = try JSONSerialization.data(withJSONObject: body)
            let (data, _) = try await URLSession.shared.data(for: request)
            if let responseData = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print("POST Response:", responseData)
            }
        } catch {
            throw error
        }
    }
     */     //MARK: async await way
    
    
    func logIn(email: String , password: String , completion: @escaping(Result<User,AuthenticationError>)->(Void)){
        
        guard let url = URL(string: "https://student.valuxapps.com/api/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBody(email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) else{
                completion(.failure(.invaliedCredentials))
                return
            }
            guard let userData = loginResponse.data else {
                completion(.failure(.invaliedCredentials))
                return
            }
            completion(.success(userData))
        }.resume()
    }
    
    func signUp(name: String , phone: String , email: String , password: String , completion: @escaping(Result<User,AuthenticationError>)->(Void)) {
        
        guard let url = URL(string: "https://student.valuxapps.com/api/register") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = SignupRequestBody(name: name, phone: phone, email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) else{
                completion(.failure(.invaliedCredentials))
                return
            }
            guard let userData = loginResponse.data else{
                completion(.failure(.invaliedCredentials))
                return
            }
            completion(.success(userData))
        }
        .resume()
        
    }
}
