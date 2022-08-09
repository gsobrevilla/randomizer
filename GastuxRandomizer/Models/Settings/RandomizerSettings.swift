//
//  RandomizerSettings.swift
//  GastuxRandomizer
//
//  Created by Gastón on 09/08/2022.
//

import Foundation

struct RandomizerSettings {
    var alphabetId: String = Alphabets.options.last!.id
    var allowRepetitions: Bool = true
}
