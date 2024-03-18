//
//  ProductsViewModel.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 16/03/2024.
//

import Foundation
import SwiftUI

@MainActor
class ProductsViewModel : ObservableObject {
    @Published var productArray : [Product] = []
    @ObservedObject var apiManager  = ApiManager()
    @Published var firstCatdegoryId : Int = 0
    
    func fetchCategory() async throws -> [Category]? {
        let categoryResponse = try await apiManager.fetchData(url: "https://student.valuxapps.com/api/categories", responseClass: CategoryResponse.self)
        firstCatdegoryId =  categoryResponse.data.data?.first?.id ?? 0
        if firstCatdegoryId != 0 {
        try await fetchProduct(categoryId: "\(firstCatdegoryId)")
        }
        return categoryResponse.data.data
    }
    
    func fetchProduct(categoryId: String) async throws {
        
        let productData = try await apiManager.fetchData(url: "https://student.valuxapps.com/api/categories/\(categoryId)", responseClass: ProductResponse.self)
        
        self.productArray = productData.data.data ?? []
    }
}
