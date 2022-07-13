//
//  Settings.swift
//  GastuxRandomizer
//
//  Created by Gastón on 02/07/2022.
//

import Foundation
import Combine

struct RandomizerSettings {
    var alphabetId: String = Alphabets.options.last!.id
    var allowRepetitions: Bool = true
}

struct AlphabetSettings {
    
    enum Field {
        case numericFrom
        case numericTo
    }
    
    var numericFrom: Int = 1
    var numericTo: Int = 6
}

class Settings: ObservableObject {
    
    @Published var randomizerSettings = RandomizerSettings() {
        didSet { changesSubject.send() } // TODO: improve defining a new property wrapper
    }
    
    @Published var alphabetSettings = AlphabetSettings() {
        didSet { changesSubject.send() } // TODO: improve defining a new property wrapper
    }
    
    var changesSubject = PassthroughSubject<Void, Never>()
    
    var allowRepetitions: Bool {
        randomizerSettings.allowRepetitions
    }
    
    var currentAlphabet: Alphabet {
        Alphabets.getById(randomizerSettings.alphabetId)
    }
    
    var values: [String] {
        Alphabets.getById(randomizerSettings.alphabetId).getValuesFor(settings: alphabetSettings)
    }
}
