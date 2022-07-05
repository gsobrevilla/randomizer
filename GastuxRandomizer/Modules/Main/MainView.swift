//
//  ContentView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 17/06/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var randomizer = Randomizer()
    @State var presentingSettingsModal = false
    @State var presentingHistoryModal = false
    @State var presentingResetConfirmation = false
    
    var joinedValues: String {
        randomizer.values.isEmpty ? "-" : randomizer.values.joined(separator: " ")
    }
    var currentValue: String { randomizer.values.last ?? "-" }
    
    var showResetButton: Bool {
        !randomizer.values.isEmpty
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    Spacer()
                    Button("Settings") {
                        presentingSettingsModal = true
                    }
                }
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 16))
               
                Spacer()
               
                // Last values text
                Text(currentValue)
                    .font(
                        .system(
                            size: 200,
                            weight: .regular,
                            design: .rounded
                        )
                    )
                    .fontWeight(.medium)
                    .transition(.opacity)
                    .foregroundColor(.primaryText)
                    .id(UUID().uuidString)
                
                Spacer()
                    .frame(height: 16)
                
                // Next values button
                Button(
                    LocalizedStringKey("new_letter_button"))
                {
                    withAnimation {
                        randomizer.generateNewValue()
                    }
                }
                .font(
                    .system(
                        size: 17,
                        weight: .medium,
                        design: .rounded)
                )
                .foregroundColor(.primaryActionForeground)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primaryActionBackground))
                
                Spacer()
                
               
                Button(LocalizedStringKey("reset_values_button")) {
                    presentingResetConfirmation = true
                }
                .font(
                .system(
                    size: 17,
                    weight: .medium,
                    design: .rounded)
                )
                .foregroundColor(.secondaryActionDestructiveForeground)
                .opacity(showResetButton ? 1 : 0)
                
                
                Spacer().frame(height: 16)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        // Previous values title
                        
                        if randomizer.settings.allowRepetitions {
                            Text(LocalizedStringKey("previous_values_title"))
                                .foregroundColor(.secondaryText)
                                .font(
                                    .system(
                                        size: 15,
                                        weight: .light,
                                        design: .rounded))
                        } else {
                            Text("\(randomizer.generatedValuesCount)/\(randomizer.possibleValuesCount ?? 0)")
                                .foregroundColor(.secondaryText)
                                .font(
                                    .system(
                                        size: 15,
                                        weight: .light,
                                        design: .rounded))
                        }
                        
                        
                        
                        Spacer()
                        
                        // See all history button
                        
                        if !randomizer.values.isEmpty {
                            Button(LocalizedStringKey("previous_values_see_history_button")) {
                                presentingHistoryModal = true
                            }
                            .foregroundColor(Color.secondaryActionForeground)
                            .font(
                                .system(
                                    size: 15,
                                    weight: .regular,
                                    design: .rounded))
                        }
                    }
                    
                    
                    // Previous values
                    Text(joinedValues)
                        .transition(.opacity)
                        .foregroundColor(.primaryText)
                        .font(
                            .system(
                                size: 20,
                                weight: .semibold,
                                design: .monospaced))
                        .lineLimit(1)
                        .truncationMode(.head)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading)
                .padding(8)
            }
        }.sheet(isPresented: $presentingSettingsModal) {
            SettingsView()
                .environmentObject(randomizer.settings)
        }.sheet(isPresented: $presentingHistoryModal) {
            HistoryView(values: randomizer.values)
        }.alert(isPresented: $presentingResetConfirmation) {
            Alert(
                title: Text(LocalizedStringKey("reset_values_confirmation_title")),
                message: nil,
                primaryButton: .destructive(Text(LocalizedStringKey("reset_values_confirmation_confirm_action"))) {
                    randomizer.reset()
                },
                secondaryButton: .cancel(Text(LocalizedStringKey("reset_values_confirmation_cancel_action")))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
