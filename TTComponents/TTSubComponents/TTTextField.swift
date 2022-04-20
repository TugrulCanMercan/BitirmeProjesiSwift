//
//  LoginTextField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI


public struct TTTextField: View {
    
    @Binding var text:String
    @State var placeHolder:String
    var prompt:String
    @State private var promtOffset:CGPoint
    public init(text:Binding<String>,
                placeHolder:String,
                promtOffset:CGPoint = .init(x: -(UIScreen.main.bounds.width/3), y: -35),
                prompt:String = ""
    ) {
        self.prompt = prompt
        self._text = text
        self.placeHolder = placeHolder
        self.promtOffset = promtOffset
    }
    public var body: some View {
        
        VStack(alignment:.leading){
            TextField(placeHolder, text: $text)
                .modifier(TTTextFieldModifier(text: $text))
                .overlay {
                    Text(prompt)
                        .foregroundColor(Color.red)
                        .fixedSize(horizontal: false, vertical: true)
                        .offset(x: promtOffset.x, y: promtOffset.y)
//                        .onAppear {
//                            withAnimation {
//                                if !prompt.isEmpty{
//                                    promtOffset = CGPoint(x: -(UIScreen.main.bounds.width/3), y: -35)
//                                }
//                            }
//                        }
                }
           
        }
       

        
        
        
    }
    
    
}




struct LoginTextField_Previews: PreviewProvider {
    @State static var mcok:String = "fdfd"
    static var hata:String = "hata"
    static var previews: some View {
        
            TTTextField(text: $mcok, placeHolder: "deneme", prompt: hata)
        
    }
}
