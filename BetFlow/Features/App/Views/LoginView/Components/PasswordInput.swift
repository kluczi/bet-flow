//
//  PasswordInput.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//


#if DEBUG
#if canImport(Appwrite)
import Appwrite
#endif
#endif

import SwiftUI

struct PasswordInput: View {
    @Binding var password: String
    @State private var isSecure = true
    var placeholder: String = ""
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.secondaryFontColor.opacity(0.8))
                        .padding(.leading, 10)
                }
                
                Group {
                    if isSecure {
                        SecureField("", text: $password)
                    } else {
                        TextField("", text: $password)
                    }
                }
                .padding(.horizontal, 10)
                .foregroundColor(Color.primaryFontColor)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            }
            
            if !password.isEmpty {
                Button(action: { isSecure.toggle() }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
        }
        .frame(minHeight: 50)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.secondaryColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.mainColor, lineWidth: 1)
        )
    }
}


#Preview {
    PasswordInputPreview()
    
}

private struct PasswordInputPreview: View {
    @State private var password = ""
    
    var body: some View {
        PasswordInput(password: $password, placeholder: "Password")
            .padding()
    }
}
