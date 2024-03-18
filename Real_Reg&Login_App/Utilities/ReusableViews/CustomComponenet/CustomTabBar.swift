//
//  CustomTabBar.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 13/03/2024.
//

import SwiftUI

struct SingleTabBarItem : View {
    var name : String
    var imageName : String
    var isActive : Bool = false
    var nameSpace: Namespace.ID
    
    var body: some View {
        if isActive {
            VStack(spacing: 5){
                Rectangle()
                    .frame(width: 30 , height: 5)
                    .foregroundColor(.accentColor)
                    .cornerRadius(30)
                Image(systemName: imageName)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                Text(name)
                    .font(.subheadline)
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
            }// Vstack
            .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
        }else{
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                Text(name)
                    .font(.subheadline)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CustomTabBar: View {
    var tabBarItems : [TabBarItem]
    @Binding var selectedIndex : Int
    @Namespace private var menuItemTransition
    var body: some View {
        ScrollViewReader{ scrollView in
            HStack(spacing: 15){
                ForEach(tabBarItems.indices , id: \.self) { index in
                    SingleTabBarItem(name:tabBarItems[index].name, imageName: tabBarItems[index].imageName, isActive: selectedIndex == index, nameSpace: menuItemTransition)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedIndex = index
                            }
                        }
                        .onChange(of: selectedIndex) { newValue in
                            withAnimation {
                                scrollView.scrollTo(newValue, anchor: .center)
                            }
                        }
                }
            }// Hstack
            .padding(8)
            .padding(.horizontal, 8)
            .background(Color.tabBarBackground)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomTabBar(tabBarItems: [.init(name: "home", imageName: "house"),.init(name: "home", imageName: "house")], selectedIndex: .constant(0))
}
