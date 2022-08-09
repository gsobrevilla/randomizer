//
//  FixedSetAlphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

class FixedSetAlphabet: Alphabet {

    let id: String
    let values: [String]
    var settingsRequired: [AlphabetSettings.Field] = []

    init(id: String, values: [String]) {
        self.id = id
        self.values = values
    }
    
    func getValuesFor(settings: AlphabetSettings) -> [String] {
        return values
    }
}
