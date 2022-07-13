//
//  SettingsFactory.swift
//  GastuxRandomizer
//
//  Created by Gastón on 13/07/2022.
//

import Foundation
import SwiftUI

class SettingsFactory {
    
    static func buildView(randomizer: Randomizer) -> some View {
        let vm = SettingsViewModel(randomizer: randomizer)
        return SettingsView(viewModel: vm)
    }
}
