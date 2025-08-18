//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by masume çetin on 16.08.2025.
//

import SwiftUI

struct ButtonBar: View {
    @Binding var animateViewsIn: Bool
    @Binding var playGame : Bool 
    let geo: GeometryProxy
    var body: some View {
        HStack {
            Spacer()
            
            InstructionsButton(animateViewsIn: $animateViewsIn, geo: geo)

            Spacer()
            PlayButton(playGame: $playGame, animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
            SettingsButton(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
        }.frame(width:geo.size.width )
    }
}

#Preview {
    GeometryReader {  geo in
        ButtonBar(animateViewsIn: .constant(true),playGame: .constant(false), geo: geo)
    }
}
