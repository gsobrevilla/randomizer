//
//  Alphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 02/07/2022.
//

import Foundation

class CharacterArrays {
    static let englishLetters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    static let spanishLetters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    static let englishVowels = ["A","E","I","O","U"]
    static let numbers09 = ["0","1","2","3","4","5","6","7","8","9"]
}

protocol Alphabet {
    var id: String { get }
    var settingsRequired: [AlphabetSettings.Field] { get }
    func getValuesFor(settings: AlphabetSettings) -> [String]
}

class Alphabets {
    
    static let options: [any Alphabet] = [
        LanguageAlphabet(id: "letters"),
        FixedSetAlphabet(id: "vowels", values: CharacterArrays.englishVowels),
        FixedSetAlphabet(id: "numbers", values: CharacterArrays.numbers09),
        NumericRangeAlphabet(id: "custom_numbers")
    ]
    
    static func getById(_ id: String) -> any Alphabet {
        return options.first(where: { $0.id == id })!
    }
}

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
