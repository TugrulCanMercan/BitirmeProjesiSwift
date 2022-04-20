//
//  TTSecureField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI

public struct TTSecureField: View {
    @Binding var text:String
    @State var placeHolder:String
    
    public init(text:Binding<String>, placeHolder:String) {
        self._text = text
        self.placeHolder = placeHolder
    }
    public var body: some View {
        
        
        SecureField(placeHolder, text: $text)
            .modifier(TTTextFieldModifier(text: $text))
        
        
        
    }
}

struct TTSecureField_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            
        }
    }
}
