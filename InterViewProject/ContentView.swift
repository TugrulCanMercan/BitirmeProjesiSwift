//
//  ContentView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import SwiftUI
import TTComponents

struct ContentView: View {
    var body: some View {
        VStack{
            TTButton(text: "tugru", clicked: {
                
            }, color: .red)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
