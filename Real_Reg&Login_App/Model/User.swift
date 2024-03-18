//
//  User.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 12/03/2024.
//

import Foundation

struct AuthResponse : Codable {
    
    var status: Bool?
    var message: String?
    var data : User?
}


struct User : Codable {
    var name : String?
    var email : String?
    var phone : String?
    var image : String?
    var id : Int?
    var token : String?
}
