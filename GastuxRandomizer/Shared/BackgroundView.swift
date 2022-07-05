//
//  BackgroundView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 29/06/2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.appBackground.ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
