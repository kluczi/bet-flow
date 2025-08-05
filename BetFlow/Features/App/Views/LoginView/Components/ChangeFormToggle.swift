//
//  ChangeFormToggle.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//

import SwiftUI

struct ChangeFormToggle: View {
    @State private var isLoginMode = true
    var body: some View {
        HStack {
            Button("Login") {
                isLoginMode = true
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(isLoginMode ? .white : .gray)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(isLoginMode ? Color.secondaryColor: .clear)
            )

            
            Button("Sign Up") {
                isLoginMode = false
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(!isLoginMode ? .white : .gray)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(!isLoginMode ? Color.secondaryColor: .clear)
            )

            
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.mainColor)
                .frame(maxWidth:.infinity)
        )
        .padding(.horizontal,20)
       

        
    }
}

#Preview {
    ZStack {
        Color.primaryBgColor.ignoresSafeArea()
        ChangeFormToggle()
    }
}
