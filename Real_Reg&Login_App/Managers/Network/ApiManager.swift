//
//  ApiManager.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case wrongUrl, responseFailed, statusError
}

@MainActor
class ApiManager : ObservableObject {
    
    func fetchData<T: Decodable>(url : String , responseClass : T.Type )async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.wrongUrl
        }
        let (data , response) = try await URLSession.shared.data(from: url , delegate: nil)
        guard let httpRespnse = response as? HTTPURLResponse else{
            throw NetworkError.responseFailed
        }
        guard httpRespnse.statusCode == 200 else {
            throw NetworkError.statusError
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
        
    }
    
}
