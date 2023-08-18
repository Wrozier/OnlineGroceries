//
//  WelcomeView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/17/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        ZStack(alignment: .top){
            Image("welcome_top_shape")
                .resizable()
                .scaledToFill()
                .frame( width: .screenWidth,
                        height: .screenWidth )
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text ("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text ("Get your orders in as fast as an hour")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
              
                NavigationLink {
                    SignInView()
                } label: {
                    
                    RoundButton(title: "Get Started") {
                    
                    }
                    
                }
                
                Spacer()
                    .frame(height: 60)
                
            }
            .padding(.horizontal, 20)
         
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
