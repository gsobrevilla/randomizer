//
//  SettingsViewModel.swift
//  GastuxRandomizer
//
//  Created by Gastón on 11/07/2022.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    struct FormFields {
        var alphabetId: String
        var allowRepetitions: Bool = true
        var numericFrom: String = ""
        var numericTo: String = ""
        var languageId: String = ""
        var diceCount: String = ""
        
        init(settings: Settings) {
            self.alphabetId = settings.randomizerSettings.alphabetId
            self.allowRepetitions = settings.randomizerSettings.allowRepetitions
            self.numericFrom = String(settings.alphabetSettings.numericFrom)
            self.numericTo = String(settings.alphabetSettings.numericTo)
            self.languageId = settings.alphabetSettings.language.rawValue
            self.diceCount = String(settings.alphabetSettings.diceCount)
        }
        
        func buildAlphabetSettings() -> AlphabetSettings {
            return AlphabetSettings(numericFrom: Int(numericFrom)!, numericTo: Int(numericTo)!, language: .init(rawValue: languageId)!, diceCount: Int(diceCount)!)
        }
        
        func buildRandomizerSettings() -> RandomizerSettings {
            return RandomizerSettings(alphabetId: alphabetId, allowRepetitions: allowRepetitions)
        }
    }
    
    let randomizer: Randomizer
    
    let options: [String]
    
    let languageOptions: [String]
    
    var alphabet: Alphabet { Alphabets.getById(formFields.alphabetId) }
    
    @Published var formFields: FormFields {
        didSet { isDirty = true }
    }
    
    var isDirty: Bool
    
    init(randomizer: Randomizer) {
        self.randomizer = randomizer
        options = Alphabets.options.map({ $0.id })
        languageOptions = AlphabetSettings.Language.allCases.map({ $0.rawValue })
        formFields = FormFields(settings: randomizer.settings)
        isDirty = false
    }
    
    func hasSetting(_ setting: AlphabetSettings.Field) -> Bool {
        alphabet.settingsRequired.contains(where: { $0 == setting })
    }
    
    func isFieldValid(_ field: AlphabetSettings.Field) -> Bool {
        if !hasSetting(field) { return true }
        switch field {
        case .numericFrom:
            if let numericFrom = Int(formFields.numericFrom) {
                return numericFrom < Int(formFields.numericTo) ?? 0
            } else { return false }
        case .numericTo:
            if let numericTo = Int(formFields.numericTo) {
                return numericTo > Int(formFields.numericFrom) ?? 0
            } else { return false }
        case .language:
            return AlphabetSettings.Language(rawValue: formFields.languageId) != nil
        case .diceCount:
            return Int(formFields.diceCount) ?? .max <= 6
        }
    }
    
    func saveChanges() {
        guard isDirty else { return }
        randomizer.settings.alphabetSettings = formFields.buildAlphabetSettings()
        randomizer.settings.randomizerSettings = formFields.buildRandomizerSettings()
    }
}
