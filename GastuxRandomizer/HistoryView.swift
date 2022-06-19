//
//  HistoryView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 19/06/2022.
//

import SwiftUI

struct HistoryView: View {
    
    let values: [String]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.hex("#f1f2f6").ignoresSafeArea()
            
            VStack() {
                Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                
                HStack {
                    Text("Valores anteriores")
                        .font(.title2)
                    Spacer()
                }.padding(16)
                

                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(values.indices, id: \.self) { index in
                                Text(values[index])
                            }
                        }
                    }
                    .onAppear {
                        proxy.scrollTo(values.count - 1)
                    }
                }
                
                Spacer()
                    .frame(height: 16)
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(values: (1...100).map { "Value \($0)" })
    }
}
