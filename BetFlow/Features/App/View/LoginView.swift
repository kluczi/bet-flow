////
////  LoginView.swift
////  BetFlow
////
////  Created by Bartek on 04/07/2025.
////
//
//import SwiftUI
//
//struct LoginView: View {
//    @StateObject private var viewModel = AuthViewModel()
//
//    var body: some View {
//        VStack {
//            TextField("Email", text: $viewModel.email)
//            SecureField("Password", text: $viewModel.password)
//
//            Button("Register") {
//                Task {
//                    try? await viewModel.register()
//                }
//            }
//
//            Button("Login") {
//                Task {
//                    try? await viewModel.login()
//                }
//            }
//        }
//        .padding()
//    }
//}
