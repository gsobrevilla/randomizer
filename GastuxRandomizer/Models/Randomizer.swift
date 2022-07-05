//
//  RandomizerManager.swift
//  GastuxRandomizer
//
//  Created by Gastón on 18/06/2022.
//

import Foundation
import Combine

class Randomizer: ObservableObject {
    
    @Published var values: [String] = []
    @Published var settings: Settings
    
    private var valuesSet: [String] = []
    
    private var settingsChangesSuscriber: AnyCancellable?
    
    var possibleValuesCount: Int? {
        return settings.allowRepetitions ? nil : settings.values.count
    }
    
    var generatedValuesCount: Int {
        return values.count
    }
    
    init() {
        self.settings = Settings()
        self.settingsChangesSuscriber = settings.changesSubject.sink(receiveValue: { [weak self] _ in
            self?.reset()
        })
        reset()
    }
    
    func generateNewValue() {
        if settings.allowRepetitions {
            values.append(valuesSet.randomElement()!)
        } else {
            if valuesSet.isEmpty {
                // nothing, all possible values were generated
            } else {
                valuesSet.shuffle()
                values.append(valuesSet.removeFirst())
            }
        }
    }

    func reset() {
        valuesSet = settings.values
        values.removeAll()
    }
}
