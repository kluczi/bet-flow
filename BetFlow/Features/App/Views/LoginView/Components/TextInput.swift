//
//  TextInput.swift
//  BetFlow
//
//  Created by Bartek on 05/08/2025.
//

import SwiftUI

struct TextInput: View {
    @Binding var value: String
    var placeholder: String = ""

    var body: some View {
            ZStack(alignment: .leading) {
                if value.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(Color.secondaryFontColor.opacity(0.8))
                        .padding(.horizontal, 10)
                }
                TextField("", text: $value)
                    .padding(10)
                    .foregroundStyle(Color.primaryFontColor)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            .frame(minHeight: 50)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primaryBgColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.mainColor, lineWidth: 1)
            )
        }
    
}


#Preview {
    TextInputPreview()
}

private struct TextInputPreview: View {
    @State private var value = ""

    var body: some View {
        TextInput(value: $value, placeholder: "E-mail")
            .padding()
    }
}
