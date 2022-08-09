//
//  LanguageAlphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

class LanguageAlphabet: Alphabet {
    
    let id: String
    var settingsRequired: [AlphabetSettings.Field] = [.language]
    
    init(id: String) {
        self.id = id
    }
    
    func getValuesFor(settings: AlphabetSettings) -> [String] {
        switch settings.language {
        case .english: return CharacterArrays.englishLetters
        case .spanish: return CharacterArrays.spanishLetters
        }
    }
}
