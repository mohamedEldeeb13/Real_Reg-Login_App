//
//  HomeView.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import SwiftUI

struct HomeView: View {
    @Namespace private var menuItemTransition
    @StateObject private var viewModel = HomeViewModel()
    @AppStorage("Log_Status") var Log_Status : Bool = false
    
    let gridColumns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 10){
                horizontalCollectionView
                headlineText(text: "Popular")
                cardCollection
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        UserDefaultManager.shared.deleteUser()
                        withAnimation {
                            self.Log_Status = false
                        }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .fontWeight(.bold)
                    }
                    
                }
            }
        }
        .task {
            do{
                try await viewModel.fetchBanners()
                try await viewModel.popularProduct()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func headlineText(text: String) -> some View{
        Text(text)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding(.leading, 20)
    }
    
    var horizontalCollectionView : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(viewModel.bannersArray, id: \.self) { banner in
                    BannerCell(banner: banner)
                }
            }
        }
        .padding(.leading, 15)
        .frame(height: 260)
    }
    
    var cardCollection: some View{
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridColumns, content: {
                ForEach(viewModel.popularArray, id: \.self){product in
                    CardCell(product: product)
                }
            })
            .padding(10)
        }
    }
}

#Preview {
    HomeView()
}
