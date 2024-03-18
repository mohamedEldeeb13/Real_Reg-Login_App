//
//  Products.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import Foundation

struct ProductResponse: Codable{
    let data: ProductData
}

struct ProductData: Codable {
    let data: [Product]?
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int?
    let price, oldPrice: Double?
    let discount: Int?
    let image: String?
    let name, description: String?
    let images: [String]?
    let inFavorites, inCart: Bool?
}
