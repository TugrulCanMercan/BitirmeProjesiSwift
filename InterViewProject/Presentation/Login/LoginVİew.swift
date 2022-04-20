//
//  ContentView.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
import TTComponents

public struct LoginView: View {
    @State var mockData:String = ""
    
    @StateObject var viewModel = LoginViewModel()
    @State var push = false
    public var body: some View {
        
        
        CustomNavView {
            
            ZStack(alignment:.center){
                
              
              
                VStack{
                    
                    
                    
                    TTTextField(text: $viewModel.email, placeHolder: "Mail Adresi",prompt: viewModel.emailPrompt)

                    TTSecureField(text: $viewModel.password, placeHolder: "Şifre")
                    
                   
                    
                    VStack{
                        TTButton(text: "Giriş Yap", clicked: {
                            viewModel.login()
                           
                        }, color: .blue)
                            .fullScreenCover(isPresented: $viewModel.showHome, onDismiss: nil) {
                                ProfileView()
                            }
                        LabelledDivider(label: "Yada")
                        
                        CustomNavLink(destination:  SingUpView()) {
                            Text("Kayıt Olmak İçin")
                                .padding(4)
                                .overlay {
                                    Capsule()
                                        .stroke(lineWidth: 4)

                                }
                        }
                        

                        
//                        TTButton(text: "Kayıt Olmak İçin", clicked: {
//                            print("")
//                        }, color: .blue)
                            
                            

                      
                      

                    }
              
                    
                }
                
                .customNavigationBarBackButtonHidden(true)
                .customNavigationTitle("Online Terfi Login")
                .customNavigationBarColor(.yellow)
                .frame(maxHeight: .infinity)
                
                
                
                
                if viewModel.showError {
                    Color.black.opacity(0.8)
                    VStack{
                        Image(systemName: "xmark.octagon.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                        Text(viewModel.errorObject?.errorDescription ?? "Hata")
                            .foregroundColor(Color.white)
                    }
                    .onTapGesture {
                        viewModel.showError.toggle()
                    }
                }
               
               
            }
           
            
         
        }
        
       
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
