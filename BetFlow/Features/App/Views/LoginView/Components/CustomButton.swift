//
//  Button.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//

import SwiftUI


struct CustomButton: View {
    var placeholder: String=""
    var action: ()->Void
    var body: some View {
        Button(action: action) {
            Text(placeholder)
                .fontWeight(.bold)
                .frame(minWidth: 100)
                .padding()
                .background(Color.secondaryColor)
                .foregroundColor(.white)
                .cornerRadius(32)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color.borderColor, lineWidth: 1)
//                )
        }
    }
}

#Preview {
    ZStack{
        Color.primaryBgColor.ignoresSafeArea()
        CustomButton(placeholder: "Login") { print("") }
            .padding()
    }
}
