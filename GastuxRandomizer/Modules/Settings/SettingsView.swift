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
                    VStack(spacing: 16) {
                        
                        // Alphabet selector
                        SettingsPickerRow(label: "Values", value: $viewModel.formFields.alphabetId, options: viewModel.options)
                        
                        // Allow repetitions
                        Toggle("Allow repeated chars",
                               isOn: $viewModel.formFields.allowRepetitions)
                        
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
                    .padding(24)
                }
            }
        }.onDisappear {
            viewModel.saveChanges()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(randomizer: Randomizer()))
    }
}
