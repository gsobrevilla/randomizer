//
//  RandomizerManager.swift
//  GastuxRandomizer
//
//  Created by Gastón on 18/06/2022.
//

import Foundation

class Randomizer: ObservableObject {
    
    @Published var values: [String] = []
    
    private var valuesSet: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    func generateNewValue() {
        values.append(valuesSet.randomElement()!)
    }
}
