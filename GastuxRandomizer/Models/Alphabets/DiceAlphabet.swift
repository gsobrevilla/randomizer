//
//  DiceAlphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

class DiceAlphabet: Alphabet {
    
    let id: String
    var settingsRequired: [AlphabetSettings.Field] = [.diceCount]
    
    init(id: String) {
        self.id = id
    }
    
    func getValuesFor(settings: AlphabetSettings) -> [String] {
        return permutations(values: (1...6).map({ "\($0)"}), n: settings.diceCount)
    }
    
    private func permutations(results: [String] = [], values: [String], n: Int) -> [String] {
        if n == 1 { return values }
        
        var newResults: [String] = []
        values.forEach { value in
            permutations(results: results, values: values, n: n - 1).forEach { previousValue in
                newResults.append("\(value)-\(previousValue)")
            }
        }
        return newResults
    }
}
