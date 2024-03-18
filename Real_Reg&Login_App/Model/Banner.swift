//
//  Banner.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import Foundation

struct HomeResponse: Codable {
    let data: HomeData
}

struct HomeData: Codable{
    let banners: [Banner]
    let products: [Product]
    let ad: String
}

struct Banner: Codable,Identifiable, Hashable{
    let id: Int?
    let image: String?
    let category: String?
    let product: String?
}
