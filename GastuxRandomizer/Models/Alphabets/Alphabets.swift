//
//  Alphabets.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

class Alphabets {
    
    static let options: [any Alphabet] = [
        LanguageAlphabet(id: "letters"),
        FixedSetAlphabet(id: "vowels", values: CharacterArrays.englishVowels),
        FixedSetAlphabet(id: "numbers", values: CharacterArrays.numbers09),
        NumericRangeAlphabet(id: "custom_numbers"),
        FixedSetAlphabet(id: "yes_no", values: ["yes", "no"]),
        DiceAlphabet(id: "dice")
    ]
    
    static func getById(_ id: String) -> any Alphabet {
        return options.first(where: { $0.id == id })!
    }
}
