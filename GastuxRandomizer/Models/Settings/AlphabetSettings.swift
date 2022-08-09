//
//  AlphabetSettings.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

struct AlphabetSettings {
    
    enum Field {
        case numericFrom
        case numericTo
        case language
        case diceCount
    }
    
    enum Language: String, CaseIterable {
        case english = "english"
        case spanish = "spanish"
    }
    
    var numericFrom: Int = 1
    var numericTo: Int = 6
    var language: Language = .english
    var diceCount: Int = 2
}
