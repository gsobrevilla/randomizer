//
//  PickerRow.swift
//  GastuxRandomizer
//
//  Created by Gastón on 13/07/2022.
//

import SwiftUI

struct SettingsPickerRow: View {
    
    let label: String
    let value: Binding<String>
    let options: [String]
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Picker(label, selection: value) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
            }
            .pickerStyle(.menu)
            .frame(height: 38)
            .background(
                Rectangle()
                    .fill(Color.cardBackground)
                    .cornerRadius(8)
            )
            .accentColor(Color.primaryText)
        }
    }
}

struct SettingsPickerRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPickerRow(label: "Picker", value: .constant("A"), options: ["A", "B", "C"])
    }
}
