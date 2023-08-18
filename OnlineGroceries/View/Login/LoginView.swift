//
//  LoginView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/18/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                    .frame(width:40)
                
                Spacer()
                    .frame(height: .screenHeight * 0.12)
                
                Text("Login")
                    .font(.customfont(.semibold , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,4)
                
                Text("Enter you email and password")
                    .font(.customfont(.semibold , fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,4)
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.top, .bottomInsets)
            
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
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
