//
//  CatogeryCell.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 16/03/2024.
//

import SwiftUI

struct CatogeryCell: View {
    var name : String
    var isActive : Bool = false
    var nameSpace : Namespace.ID
    var body: some View {
        Text(name)
            .font(.caption.bold())
            .padding(.horizontal,8)
            .padding(10)
            .foregroundStyle(isActive ? .white : .black)
            .background{
                if !isActive {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 1)
                        .fill(Color.gray.opacity(0.4))
                }else{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.accentColor.opacity(0.8))
                        .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
                }
            }
    }
}

