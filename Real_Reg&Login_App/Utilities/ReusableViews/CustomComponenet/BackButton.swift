//
//  BackButton.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 11/03/2024.
//

import SwiftUI

struct BackButton<Label: View> : View {
    var action : () -> Void
    var label : Label
    init(action: @escaping () -> Void,@ViewBuilder label: ()-> Label) {
        self.action = action
        self.label = label()
    }
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: "chevron.backward")
                .padding(10)
                .padding(.horizontal, 5)
                .font(.title3.bold())
                .foregroundStyle(Color.white)
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.accentColor.opacity(0.8)))
        }
        .padding()
    }
}

#Preview {
    BackButton(action: {}, label: {})
}
