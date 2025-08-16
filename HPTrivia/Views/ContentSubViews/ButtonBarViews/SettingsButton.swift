//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by masume çetin on 16.08.2025.
//

import SwiftUI

struct SettingsButton: View {
    @Binding var animateViewsIn: Bool
    @State var showSettings: Bool = false
    let geo: GeometryProxy
    var body: some View {
        VStack{
        if animateViewsIn {
            Button{
                showSettings.toggle()
            }
            label :{
                Image(systemName: "gearshape.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
            }
            .transition(.offset(x:geo.size.width/4))
        } }
        .animation(.easeOut(duration: 0.7).delay(2.7),value: animateViewsIn)
    }
}

#Preview {
    GeometryReader {  geo in
        SettingsButton(animateViewsIn: .constant(true),geo: geo)
    }
}
