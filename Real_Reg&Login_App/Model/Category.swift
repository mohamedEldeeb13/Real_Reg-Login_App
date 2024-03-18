//
//  Category.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 16/03/2024.
//

import Foundation

struct CategoryResponse: Codable {
    let data: CategoryData
}

struct CategoryData: Codable {
    let data: [Category]?
}

struct Category: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
}
