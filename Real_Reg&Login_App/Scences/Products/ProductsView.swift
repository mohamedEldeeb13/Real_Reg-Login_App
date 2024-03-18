//
//  ProductsView.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel = ProductsViewModel()
    @Namespace private var menuItemTransition
    @State var selectedIndex : Int = 0
    @State private var categories : [Category] = []
    var body: some View {
        NavigationView {
            VStack{
                catogeryCollection
                verticalCollection
            }
            .navigationTitle("Products")
        }
        .task {
            do{
                categories = try await viewModel.fetchCategory() ?? []
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    var catogeryCollection : some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal , showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories.indices , id: \.self) { index in
                        CatogeryCell(name: categories[index].name, isActive: selectedIndex == index, nameSpace: menuItemTransition)
                            .onTapGesture {
                                self.selectedIndex = index
                                Task {
                                    do{
                                        try await viewModel.fetchProduct(categoryId: "\(categories[index].id)")
                                    }catch{
                                        print(error.localizedDescription)
                                    }
                                }
                            }
                            .onChange(of: selectedIndex) { oldView ,newValue in
                                withAnimation {
                                    scrollView.scrollTo(newValue , anchor: .center)
                                }
                            }
                    }
                }//: HStack
                .padding(.horizontal, 15)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(25)
            }//: ScrollView
        }
        .animation(.easeOut, value: selectedIndex)
    }
    
    var verticalCollection : some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack{
                ForEach(viewModel.productArray , id: \.self) { product in
//                    NavigationLink {
//                        Detailsview()
//                    } label: {
//                        VerticalCell(product: product)
//                    }

                    VerticalCell(product: product)
                }
            }
            .padding()
        }
    }
}
#Preview {
    ProductsView()
}
