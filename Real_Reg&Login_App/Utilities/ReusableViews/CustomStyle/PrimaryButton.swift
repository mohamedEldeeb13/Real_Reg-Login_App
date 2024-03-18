//
//  PrimaryButton.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 10/03/2024.
//

import SwiftUI


enum ButtonSize {
    case Large , meduim
    
    var height : CGFloat {
        switch self {
        case .Large:
            return 60
        case .meduim:
            return 48
        }
    }
}

struct PrimaryButton : ButtonStyle {
    let buttonSize : ButtonSize
    var icon : ImageResource?
    
    @Environment(\.isEnabled) var isEnable
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Spacer()
            if let icon {
                Image(icon)
                    .font(.system(size: 40 , weight: .light))
            }
            configuration.label
            Spacer()
        }// Hstack
        .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
        .font(.system(buttonSize == .meduim ? .title3 : .title2 , design: .rounded, weight: .bold ))
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity)
        .frame(height: buttonSize.height)
        .background(Color.primaryButton)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .opacity(configuration.isPressed ? 0 : 1)
        .saturation(isEnable ? 1 : 0)
    }
}

extension ButtonStyle where Self == PrimaryButton {
    static func customButtonStyle(size : ButtonSize = .Large , icon : ImageResource? = nil) -> Self {
        PrimaryButton(buttonSize: .Large , icon: icon)
    }
}
