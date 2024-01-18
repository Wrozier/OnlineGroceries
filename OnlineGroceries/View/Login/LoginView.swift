//
//  LoginView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/18/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    
    var body: some View {
        ZStack  {
           Image("splash_bg")
            .resizable()
            .scaledToFill()
            .frame( width: .screenWidth,
                    height: .screenHeight )
            VStack{
                
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Login")
                    .font(.customfont(.medium , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,4)
                
                Text("Enter you email and password")
                    .font(.customfont(.semibold , fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField( title:"Email", placholder: "Enter your email address", txt:$loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom,.screenWidth * 0.07)
                
                LineSecureField( title:"Password", placholder:"Enter your password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    
                    
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium , fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth:0 , maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom,.screenWidth * 0.03)

                RoundButton(title: "Log In") {
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom,.screenWidth * 0.05)
                
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack{
                        Text("Dont have an account?")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.primaryText)
                        Text("Sign Up?")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.primaryApp)
                        
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.top)
            
            VStack {
                HStack {
                    Button{
                        mode.wrappedValue.dismiss()
                    }label:{
                        Image("btn_back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $loginVM.showError){
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage),
                  dismissButton: .default(Text("Ok")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            LoginView()
        }
    }
}
