//
//  SettingsView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 29/06/2022.
//

import SwiftUI

struct SettingsView: View {
    
    let options: [String] = Alphabets.options.map({ $0.id })
    
    @EnvironmentObject var settings: Settings
    
    var body: some View {
      
        ZStack {
            BackgroundView()
            VStack {
                SheetDragControlView()
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("Values")
                            Spacer()
                            
                          
                            Picker("Values", selection: $settings.randomizerSettings.alphabetId) {
                                ForEach(options, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .pickerStyle(.menu)
                            .background(
                                Rectangle()
                                    .fill(Color.cardBackground)
                                    .cornerRadius(8)
                            )
                            .accentColor(Color.primaryText)
                            
                            
                            
                        }
                        
                        
                        
//                        if settings.rando.alphabetId == "numbers" {
//                            HStack {
//                                Text("From")
//                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//
//                                TextField("Desde", text: $settings.rangeFrom)
//                                    .frame(minWidth: 0, maxWidth: .infinity)
//                                    .multilineTextAlignment(.trailing)
//                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 12))
//                                    .background(
//                                        Rectangle()
//                                            .fill(Color.cardBackground)
//                                            .cornerRadius(8)
//                                    )
//                            }
//
//                            HStack {
//                                Text("To")
//                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//
//                                TextField("Desde", text: $settings.rangeTo)
//                                    .frame(minWidth: 0, maxWidth: .infinity)
//                                    .multilineTextAlignment(.trailing)
//                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 12))
//                                    .background(
//                                        Rectangle()
//                                            .fill(Color.cardBackground)
//                                            .cornerRadius(8)
//                                    )
//                            }
//                        }
                        
                        Toggle("Allow repeated chars", isOn: $settings.randomizerSettings.allowRepetitions)
                           
                    }
                    .padding(24)
                }
            }
        }
        
            
            
        
            
//            Form {
//                Section {
//
//                } header: {
//                    Text("Alphabet")
//                }
//
//                Section {
//                    Toggle("Allow repeated chars", isOn: .constant(true))
//                } header: {
//                    Text("General Options")
//                }
//            }
        
//                .onAppear { // ADD THESE
//                  UITableView.appearance().backgroundColor = .clear
//                }
//                .onDisappear {
//                  UITableView.appearance().backgroundColor = .systemGroupedBackground
//                }
            
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
