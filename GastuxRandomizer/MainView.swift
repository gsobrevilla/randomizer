//
//  ContentView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 17/06/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var randomizer = Randomizer()
    @State var presentingHistoryModel = false
    
    var joinedValues: String {
        randomizer.values.isEmpty ? "-" : randomizer.values.joined(separator: " ")
    }
    var currentValue: String { randomizer.values.last ?? "-" }
    
    var body: some View {
        ZStack {
            Color.hex("#f1f2f6").ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
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
                    .foregroundColor(.hex("#2f3542"))
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
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.hex("#1e90ff")))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        // Previous values title
                        Text(LocalizedStringKey("previous_values_title"))
                            .foregroundColor(.hex("#57606f"))
                            .font(
                                .system(
                                    size: 15,
                                    weight: .light,
                                    design: .rounded))
                        
                        Spacer()
                        
                        // See all history button
                        Button(LocalizedStringKey("previous_values_see_history_button")) {
                            presentingHistoryModel = true
                        }
                        .foregroundColor(Color.hex("#1e90ff"))
                        .font(
                            .system(
                                size: 15,
                                weight: .regular,
                                design: .rounded))
                    }
                    
                    
                    // Previous values
                    Text(joinedValues)
                        .transition(.opacity)
                        .foregroundColor(.hex("#2f3542"))
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
        }.sheet(isPresented: $presentingHistoryModel) {
            HistoryView(values: randomizer.values)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
