//
//  HistoryView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 19/06/2022.
//

import SwiftUI

struct HistoryView: View {
    
    let values: [String]
    
    let orderedValues: [String]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(values: [String]) {
        self.values = values
        self.orderedValues = values.reversed()
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack() {
                Capsule()
                    .fill(Color.secondaryText)
                    .frame(width: 30, height: 3)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(orderedValues.indices, id: \.self) { index in
                                HStack {
                                    Spacer().frame(minWidth: 0, maxWidth: .infinity)
                                    Text(orderedValues[index])
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding(24)
                                        .background(
                                            Rectangle()
                                                .fill(Color.cardBackground)
                                                .cornerRadius(8)
                                        )
                                        .foregroundColor(.primaryText)
                                        .font(.system(size: 24))
                                    Spacer().frame(minWidth: 0, maxWidth: .infinity)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                }
                
                Spacer()
                    .frame(height: 16)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(values: ["A","B","C","D","E","F","A","B","C","D","E","F","A","B","C","D","E","F","A","B","C","D","E","F"])
    }
}
