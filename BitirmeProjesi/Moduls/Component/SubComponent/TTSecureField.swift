//
//  TTSecureField.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI

public struct TTSecureField: View {
    @State var mockText:String
    @State var placeHolder:String
    
    public init(mockText:String, placeHolder:String) {
        self.mockText = mockText
        self.placeHolder = placeHolder
    }
    public var body: some View {
        
        
        SecureField(placeHolder, text: $mockText)
            .modifier(TTTextFieldModifier(text: $mockText))
        
        
        
    }
}

struct TTSecureField_Previews: PreviewProvider {
    static var previews: some View {
        TTSecureField(mockText: "", placeHolder: "")
    }
}
