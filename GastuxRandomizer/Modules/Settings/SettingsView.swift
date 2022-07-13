//
//  SettingsView2.swift
//  GastuxRandomizer
//
//  Created by Gastón on 05/07/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                SheetDragControlView()
                ScrollView {
                    VStack {
                        
                        // Alphabet selector
                        HStack {
                            Text("Values")
                            Spacer()
                            Picker("Values", selection: $viewModel.formFields.alphabetId) {
                                ForEach(viewModel.options, id: \.self) { option in
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
                        
                        // Allow repetitions
                        Toggle("Allow repeated chars", isOn: $viewModel.formFields.allowRepetitions)
                        
                        // From
                        if(viewModel.hasSetting(.numericFrom)) {
                            SettingsTextFieldRow(
                                value: $viewModel.formFields.numericFrom,
                                label: "Desde",
                                placeholder: "",
                                valid: viewModel.isFieldValid(.numericFrom)
                            )
                        }
                        
                        
                        // To
                        if(viewModel.hasSetting(.numericTo)) {
                            SettingsTextFieldRow(
                                value: $viewModel.formFields.numericTo,
                                label: "Hasta",
                                placeholder: "",
                                valid: viewModel.isFieldValid(.numericTo)
                            )
                        }
                    }
                }
            }
        }.onDisappear {
            viewModel.saveChanges()
        }
    }
}

struct SettingsView2_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(randomizer: Randomizer()))
    }
}
