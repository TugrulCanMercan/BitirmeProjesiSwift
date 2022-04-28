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
        
        TTView(content: {
            
            CustomNavView{
                VStack{
                    VStack{
                        TTTextField(placeHolder: "Email", errorhanlde: viewModel.formMessage.emailFormMessage, text: $viewModel.email)
                        
                        TTSecureField(placeHolder: "Şifre",errorhanlde: viewModel.formMessage.passwordFormMessage, text: $viewModel.password)
                    }.padding(.horizontal,6)
                    
                    VStack{
                        TTButton(text: "Giriş Yap", clicked: {
                            viewModel.login()
                            
                        }, color: viewModel.loginButtonColor ? .blue : .yellow)
                        .fullScreenCover(isPresented: $viewModel.showHome, onDismiss: nil) {
                            HomeView()
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
                        
                        Button {
                            
                            push.toggle()
                            
                            
                        } label: {
                            Text("dsadsa")
                        }
                        
                        
                        
                    }
                    
                }
                .padding()
                
                .customNavigationBarBackButtonHidden(true)
                .customNavigationTitle("Online Terfi Login")
                .customNavigationBarColor(.yellow)
                .frame(maxHeight: .infinity)
            }
            
        }, popUpContent: {
            PopUp(push: $push, errorMessage: "hata", errorImageName: "xmark.octagon.fill")
            
            
        }, showActivate: $push)
        
        
        //        CustomNavView {
        //
        //            ZStack(alignment:.center){
        //
        //
        //
        //                VStack{
        //
        //                    VStack{
        //                        TTTextField(placeHolder: "Email", errorhanlde: viewModel.formMessage.emailFormMessage, text: $viewModel.email)
        //
        //                        TTSecureField(placeHolder: "Şifre",errorhanlde: viewModel.formMessage.passwordFormMessage, text: $viewModel.password)
        //                    }.padding(.horizontal,6)
        //
        //
        //
        //
        //                    VStack{
        //                        TTButton(text: "Giriş Yap", clicked: {
        //                            viewModel.login()
        //
        //                        }, color: viewModel.loginButtonColor ? .blue : .yellow)
        //                            .fullScreenCover(isPresented: $viewModel.showHome, onDismiss: nil) {
        //                                HomeView()
        //                            }
        //                        LabelledDivider(label: "Yada")
        //
        //                        CustomNavLink(destination:  SingUpView()) {
        //                            Text("Kayıt Olmak İçin")
        //                                .padding(4)
        //                                .overlay {
        //                                    Capsule()
        //                                        .stroke(lineWidth: 4)
        //
        //                                }
        //
        //                        }
        //
        //
        //                    }
        //
        //
        //                }
        //                .padding()
        //
        //                .customNavigationBarBackButtonHidden(true)
        //                .customNavigationTitle("Online Terfi Login")
        //                .customNavigationBarColor(.yellow)
        //                .frame(maxHeight: .infinity)
        //
        //
        //
        //
        //                if viewModel.showError {
        //                    Color.black.opacity(0.8)
        //                    VStack{
        //                        Image(systemName: "xmark.octagon.fill")
        //                            .resizable()
        //                            .frame(width: 50, height: 50)
        //                            .foregroundColor(.red)
        //                        Text(viewModel.errorObject?.errorDescription ?? "Hata")
        //                            .foregroundColor(Color.white)
        //                    }
        //                    .onTapGesture {
        //                        viewModel.showError.toggle()
        //                    }
        //                }
        //
        //
        //            }
        //
        //
        //
        //        }
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct PopUp: View {
    
    @Binding var push:Bool
    let errorMessage:String
    let errorImageName:String
    @State var degre:CGFloat = .zero
    init(
        push:Binding<Bool>,
        errorMessage:String,
        errorImageName:String
    ){
        self._push = push
        self.errorMessage = errorMessage
        self.errorImageName = errorImageName
    }
    
    
    var body: some View {
        VStack{
            GeometryReader{geo in
                RoundedRectangle(cornerRadius: 15)
                
                    .fill(Color.yellow)
                    
                    .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    .overlay {
                        VStack{
                            Text(errorMessage)
                            
                            Image(systemName: errorImageName)
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 75, height:75, alignment: .center)
                            
                            
                        }
 
                    }
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
                  
                
                
                    .onTapGesture {
                        push.toggle()
                    }
                
                
                
                
            }
            
            
        }
    }
}
