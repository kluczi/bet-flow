//
//  ContentView.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import SwiftUI
import Appwrite

class ViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    let appwrite = Appwrite()
    
    @State private var isLoggedIn = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button("Login") {
                    Task {
                        do {
                            _ = try await appwrite.onLogin(viewModel.email, viewModel.password)
                            isLoggedIn = true
                        } catch let error as AppwriteError {
                            errorMessage = "Login failed: \(error.message)"
                        } catch {
                            errorMessage = "Unexpected error: \(error.localizedDescription)"
                        }
                    }
                }
                .padding(.top)
                
                
                Button("Logout") {
                               Task {
                                   do {
                                       try await appwrite.onLogout()
                                       isLoggedIn = false
                                   } catch let error as AppwriteError {
                                       print("Logout failed: \(error.message)")
                                   } catch {
                                       print("Unexpected error: \(error.localizedDescription)")
                                   }
                               }
                           }
                           .padding()
                           .buttonStyle(.bordered)
                
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }}
        
    }
}
