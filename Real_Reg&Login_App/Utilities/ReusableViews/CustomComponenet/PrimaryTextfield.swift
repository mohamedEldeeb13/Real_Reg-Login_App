//
//  PrimaryTextfield.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 11/03/2024.
//

import SwiftUI

struct PrimaryTextfield: View {
    let placeHolder : String
    @Binding var text : String
    var secured : Bool = false
    @State private var showPassword : Bool = true
    
    var body: some View {
        textField
            .padding(15)
            .background(Color.textField)
            .mask(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.2))
            }
            .overlay(alignment: .trailing) {
                if secured{
                    showHidePasswordButton
                }
            }
            .onAppear(perform: {
                if secured {
                    showPassword = false
                }
            })
    }
    
    var textField : some View {
        Group {
            if showPassword {
                TextField(placeHolder, text: $text)
            }else{
                SecureField(placeHolder, text: $text)
            }
        }
    }
    
    var showHidePasswordButton : some View {
        Button {
            showPassword.toggle()
        } label: {
            Image(systemName: showPassword ? "eye.slash" : "eye")
        }
        .padding(.trailing, 18)
    }
}


#Preview {
    PrimaryTextfield(placeHolder: "name", text: .constant("sjkcsj") , secured: true)
}
