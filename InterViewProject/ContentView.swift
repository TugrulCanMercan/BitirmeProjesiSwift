//
//  ContentView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import SwiftUI
import TTComponents

struct ContentView: View {
    
    @State var show:Bool = false
    
    @State var degre:CGFloat = .zero
    var body: some View {
        
        VStack{
            
            
      
            
                
                Rectangle()
                
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(.red)
                    .rotationEffect(.degrees(degre))
                    .animation(.interpolatingSpring(stiffness: 5, damping: 2).speed(2),value: degre)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 2)) {
                            degre = 45
                        }
                        withAnimation {
                            degre = .zero
                        }
                        
                      
                    })
                    
                    
               
                
                
                
                
                
                
            
//            }else{
//
//                RoundedRectangle(cornerRadius: 10)
//
//                    .frame(width: 50, height: 50, alignment: .center)
//                    .rotationEffect(.degrees(degre))
//                    .onAppear {
//                            let baseAnimation = Animation.easeInOut(duration: 1)
////                        let repeated = baseAnimation.repeatForever(autoreverses: true)
//
//                        withAnimation(baseAnimation) {
//                            degre = 45
//                        }
//
//
//                        withAnimation(.easeInOut.delay(0.5)) {
//                                degre = .zero
//                            }
//
//
//                    }
//
//
//
//
//            }
            
            
        }
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
