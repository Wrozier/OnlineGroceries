//
//  SignInView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/17/23.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    
    @State var  txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    var body: some View {
        
        ZStack{
            Image("splash_bg")
                .resizable()
                .scaledToFill()
                .frame( width: .screenWidth,
                        height: .screenHeight )
               
            
            
            VStack{
                Image("welcome_top_shape")
                    .resizable()
                    .scaledToFill()
                    .frame( width: .screenWidth,
                            height: .screenWidth )
                Spacer()
            }
            ScrollView{
                
                VStack (alignment: .leading){
                    Text ("Get your groceries \n with nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom , 25)
                    
                    HStack{
                        Button {
                            isShowPicker = true
                        } label: {
                 //           Image("")
                            if let countryObj = countryObj{
                                
                                
                                Text ("\( countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                
                                
                                Text ("+\( countryObj.phoneCode)")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    
                            }
                           
                        }
                        TextField("Enter Mobile", text: $txtMobile )
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    NavigationLink{
                        LoginView()
                    } label: {
                        Text ("Continue with Email Sign In")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth:.infinity, minHeight: 60)
                    .background(Color(hex:"5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    
                  
                    
                    NavigationLink{
                        SignUpView()
                    } label: {
                        Text ("Continue with Email Sign Up")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth:.infinity, minHeight: 60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    
                    Divider()
                        .padding(.bottom,20)
                    
                    
                    Text ("Or connect with Social Media")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                        .padding(.bottom , 25)
                }
                
                Button {
                    
                } label: {
                    Image("google_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20, height:20)
                    Text ("Continue with Google")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 60 ,
                    maxHeight: 60
                )
                .background(Color(hex:"5383EC"))
                .cornerRadius(20)
                .padding(.bottom,8)
                
                Button {
                    
                } label: {
                    Image("facebook_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20, height:20)
                    
                    Text ("Continue with Facebook")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 60 ,
                    maxHeight: 60
                )
                .background(Color(hex:"F94D00"))
                .cornerRadius(20)
                .padding(.bottom,8)
                
            }
            .padding(.horizontal, 20)
            .frame(width: .screenWidth, alignment: .leading)
            .padding(.top, .topInsets + .screenWidth * 0.7 )
            
            
           
        }
        .onAppear {
            self.countryObj = Country(phoneCode: "1" , isoCode: "")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
