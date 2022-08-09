//
//  SettingsTextFieldRow.swift
//  GastuxRandomizer
//
//  Created by Gastón on 13/07/2022.
//

import SwiftUI

struct SettingsTextFieldRow: View {
    
    let value: Binding<String>
    let label: String
    let placeholder: String
    let valid: Bool
    
    var textColor: Color {
        valid ? .primaryText : .invalid
    }
    
    var borderColor: Color {
        valid ? .clear : .invalid
    }
    
    var body: some View {
        HStack {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            TextField(placeholder, text: value)
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.trailing)
                .padding(
                    EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 12)
                )
                .foregroundColor(textColor)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.cardBackground)
                        )
                )
        }
    }
}

struct SettingsTextFieldRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTextFieldRow(value: .constant("Value"), label: "Label", placeholder: "Placeholder", valid: true)
    }
}
