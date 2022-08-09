//
//  NumericRangeAlphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

class NumericRangeAlphabet: Alphabet {
    
    let id: String
    var settingsRequired: [AlphabetSettings.Field] = [.numericFrom, .numericTo]
    
    init(id: String) {
        self.id = id
    }
    
    func getValuesFor(settings: AlphabetSettings) -> [String] {
        return (settings.numericFrom...settings.numericTo).map({ String($0) })
    }
}
