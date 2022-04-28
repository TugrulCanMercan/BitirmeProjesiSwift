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
                
                
                
                
                TTTextField(placeHolder: "Kullanıcı adı",errorhanlde:VM.formSignUpMessage.nameMessage,text: $VM.name)
                    
                    

                TTTextField(placeHolder: "Kullanıcı soyadı",errorhanlde: VM.formSignUpMessage.surname,text: $VM.surname)
                
                TTTextField(placeHolder: "Mail Adresi",errorhanlde: VM.formSignUpMessage.email,text: $VM.email)
                
                TTTextField(placeHolder: "Şifre",errorhanlde: VM.formSignUpMessage.password,text: $VM.password)

                
              
               
                
             
                    TTButton(text: "Kayıt Ol", clicked: {
                        VM.signUp()
                    }, color: .blue)
                    .fullScreenCover(isPresented: $VM.successPushLogin, onDismiss: nil) {
                        LoginView()
                    }
                    
                

                
            }
            .padding(.horizontal,6)
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
