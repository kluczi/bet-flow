//
//  LoginForm.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}

struct LoginForm: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        VStack {
            VStack {
                Text("Login Form")
                    .foregroundStyle(Color.primaryFontColor)
                TextInput(value: $viewModel.email, placeholder: "E-mail")
                PasswordInput(password: $viewModel.password, placeholder: "Password")
            }
            .padding(8)
        }
        .frame(minWidth:150, minHeight: 200)
        .background(Color.primaryBgColor)
        .cornerRadius(12)
        .padding(.horizontal,16)
        
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        LoginForm()
    }
}


