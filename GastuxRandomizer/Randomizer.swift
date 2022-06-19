//
//  RandomizerManager.swift
//  GastuxRandomizer
//
//  Created by Gastón on 18/06/2022.
//

import Foundation

class Randomizer: ObservableObject {
    
    @Published var values: [String] = []
    
    private var valuesSet: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func generateNewValue() {
        values.append(valuesSet.randomElement()!)
    }
}
