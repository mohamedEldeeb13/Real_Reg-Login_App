//
//  TabBarView.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 12/03/2024.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedIndex: Int = 0
    private let tabbarItems: [TabBarItem] = [.init(name: "Home", imageName: "house"),.init(name: "Products", imageName: "tray.full") ]
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedIndex,
                    content:  {
                HomeView()
                    .tag(0)
                ProductsView()
                    .tag(1)
            })
            .ignoresSafeArea(edges: .bottom)
            VStack{
                Spacer()
                CustomTabBar(tabBarItems: tabbarItems, selectedIndex: $selectedIndex)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TabBarView()
}
