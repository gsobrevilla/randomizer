//
//  SheetDragControlView.swift
//  GastuxRandomizer
//
//  Created by Gastón on 29/06/2022.
//

import SwiftUI

struct SheetDragControlView: View {
    var body: some View {
        Capsule()
            .fill(Color.secondaryText)
            .frame(width: 30, height: 3)
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
    }
}

struct SheetDragControlView_Previews: PreviewProvider {
    static var previews: some View {
        SheetDragControlView()
    }
}
