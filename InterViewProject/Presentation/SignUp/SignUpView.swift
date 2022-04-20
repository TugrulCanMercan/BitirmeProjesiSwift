//
//  SignUp.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
import TTComponents

struct SingUpView: View {
    @State var mockData:String = ""
    @StateObject var VM = SignUpViewModel()
    var body: some View {
        
        
        ZStack{
            VStack{
                
                TTTextField(text: $VM.name, placeHolder: "Kullanıcı adı")
                
                TTTextField(text: $VM.surname, placeHolder: "Kullanıcı soyadı")
                
                TTTextField(text: $VM.email, placeHolder: "Mail Adresi")
                
                TTTextField(text: $VM.passwrod, placeHolder: "Şifre")
                
              
               
                
             
                    TTButton(text: "Kayıt Ol", clicked: {
                        VM.signUp()
                    }, color: .blue)
                    .fullScreenCover(isPresented: $VM.successPushLogin, onDismiss: nil) {
                        LoginView()
                    }
                    
                

                
            }
            if VM.showError {
                Color.black.opacity(0.8)
                VStack{
                    Image(systemName: VM.handleView?.errorImage ?? "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                    Text(VM.handleView?.errorDescription ?? "Hata")
                        .foregroundColor(Color.white)
                }
                .onTapGesture {
                    VM.showError.toggle()
                }
            }
            
        }
            
            
            .customNavigationBarBackButtonHidden(false)
            .customNavigationTitle("SignUp")
            .customNavigationBarColor(.green)
            .frame(maxHeight: .infinity)
            
    
        
       
    }
    
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
