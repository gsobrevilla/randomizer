//
//  GastuxRandomizerApp.swift
//  GastuxRandomizer
//
//  Created by Gastón on 17/06/2022.
//

import SwiftUI

@main
struct GastuxRandomizerApp: App {
    
    let randomizer = Randomizer()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
