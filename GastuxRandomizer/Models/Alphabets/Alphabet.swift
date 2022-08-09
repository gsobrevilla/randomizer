//
//  Alphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 02/07/2022.
//

import Foundation

protocol Alphabet {
    
    var id: String { get }
    var settingsRequired: [AlphabetSettings.Field] { get }
    func getValuesFor(settings: AlphabetSettings) -> [String]
}
