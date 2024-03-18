//
//  HomeViewModel.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 17/03/2024.
//

import Foundation
import SwiftUI
@MainActor
class HomeViewModel : ObservableObject {
    @Published var bannersArray: [Banner] = []
    @Published var popularArray: [Product] = []
    @ObservedObject var apiManager  = ApiManager()

    func fetchBanners()async throws{
        let bannersResponse = try await apiManager.fetchData(url: "https://student.valuxapps.com/api/home", responseClass: HomeResponse.self)
        self.bannersArray =  bannersResponse.data.banners
    }
    
    func popularProduct() async throws{
        let popular = try await apiManager.fetchData(url: "https://student.valuxapps.com/api/categories/44", responseClass: ProductResponse.self)
        self.popularArray = popular.data.data ?? []
    }
}
