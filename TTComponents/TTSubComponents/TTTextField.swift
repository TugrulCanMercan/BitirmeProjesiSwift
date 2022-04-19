//
//  LoginTextField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI


public struct TTTextField: View {
    
    @State var mockText:String
    @State var placeHolder:String
    
    public init(mockText:String, placeHolder:String) {
        self.mockText = mockText
        self.placeHolder = placeHolder
    }
    public var body: some View {
        TextField(placeHolder, text: $mockText)
            .modifier(TTTextFieldModifier(text: $mockText))
        
        
        
    }
    
    
}




struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        TTTextField(mockText: "", placeHolder: "")
    }
}
