//
//  ContentView.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import SwiftUI
import Appwrite

struct ContentView: View {
    let appwrite = Appwrite()
    
    @State private var isLoggedIn = false
    @State private var isLoginMode = true
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                ChangeFormToggle(isLoginMode: $isLoginMode)
                if isLoginMode {
                    LoginForm { email, password in
                        Task {
                            do {
                                _ = try await appwrite.onLogin(email, password)
                                isLoggedIn = true
                                errorMessage = nil
                            } catch let error as AppwriteError {
                                errorMessage = "Login failed: \(error.message)"
                            } catch {
                                errorMessage = "Unexpected error: \(error.localizedDescription)"
                            }
                        }
                    }
                } else {
                    SignupForm { email, password, name in
                        Task {
                            do {
                                _ = try await appwrite.onRegister(email, password, name)
                                isLoggedIn = false
                                errorMessage = nil
                            } catch let error as AppwriteError {
                                errorMessage = "Login failed: \(error.message)"
                            } catch {
                                errorMessage = "Unexpected error: \(error.localizedDescription)"
                            }
                        }
                        
                    }
                }
                
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 8)
                }
                
                //                if isLoggedIn {
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
                //                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryBgColor)
            .ignoresSafeArea()
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarBackground(Color.clear, for: .navigationBar)
    }
}
