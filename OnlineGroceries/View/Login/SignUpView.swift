//
//  SignUpView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 10/9/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("bg_bottom")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight )
            
            ScrollView{
               
                VStack{
                    
                    
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    
                    Text("Sign Up")
                        .font(.customfont(.medium , fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,4)
                    
                    Text("Enter your credentials to continue")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField( title:"Username", placholder: "Enter your username", txt:$mainVM.txtUsername)
                        .padding(.bottom,.screenWidth * 0.07)
                    
                    LineTextField( title:"Email", placholder: "Enter your email address", txt:$mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom,.screenWidth * 0.07)
                    
                    LineSecureField( title:"Password", placholder:"Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom,.screenWidth * 0.04)
                    
                    VStack {
                        Text("By countinuing you agree to our terms .")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("Terms of Service")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.primaryApp)
                                
                            
                            Text(" and ")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("Privacy Policy")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.primaryApp)
                        }
                        .padding(.bottom, .screenWidth * 0.1)
                        
                    }
                    
                    
                        
                    
                   
                    RoundButton(title: "Sign Up") {
                        mainVM.serviceCallSignUp()
                    }
                    .padding(.bottom,.screenWidth * 0.01)
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack{
                            Text("Already have an account?")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.primaryText)
                            Text("Sign In")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.primaryApp)
                            
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.top)
            }
            
            VStack{
                
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("btn_back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            .padding(.top,.topInsets )
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text (mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignUpView()
}
