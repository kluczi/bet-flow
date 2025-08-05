//
//  SignupForm.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    
}

struct SignupForm: View {
    @StateObject private var viewModel = SignupViewModel()
    var onSignup: (String, String, String) -> Void
    
    var body: some View {
        VStack {
            VStack {
                Text("Signup")
                    .foregroundStyle(Color.primaryFontColor)
                TextInput(value: $viewModel.name, placeholder: "Name")
                TextInput(value: $viewModel.email, placeholder: "E-mail")
               
                PasswordInput(password: $viewModel.password, placeholder: "Password")
                CustomButton(placeholder: "Create account") {
                    onSignup(viewModel.email, viewModel.password, viewModel.name)
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
        SignupForm { email, password, name in
            print("Preview login with \(email), \(password), \(name)")
        }    }
}

