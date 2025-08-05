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
    var onLogin: (String, String) -> Void
    var body: some View {
        VStack {
            VStack {
                Text("Login Form")
                    .foregroundStyle(Color.primaryFontColor)
                TextInput(value: $viewModel.email, placeholder: "E-mail")
                PasswordInput(password: $viewModel.password, placeholder: "Password")
                CustomButton(placeholder: "Login") {
                    onLogin(viewModel.email, viewModel.password)
                }
            }
            .padding(8)
        }
        .frame(minWidth:150, minHeight: 300)
        .background(Color.mainColor)
        .cornerRadius(12)
        .padding(.horizontal,12)
        
    }
}

#Preview {
    ZStack {
        Color.primaryBgColor.ignoresSafeArea()
        LoginForm { email, password in
                print("Preview login with \(email), \(password)")
            }    }
}


