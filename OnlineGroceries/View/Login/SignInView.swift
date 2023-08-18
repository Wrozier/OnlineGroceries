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
                .padding(.bottom , 25)
            
            
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
                    Text ("Get your groceries \nwith nectar")
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
                    Divider()
                        .padding(.bottom,25)
                    
                    
                    Text ("Or connect with Social Media")
                        .font(.customfont(.semibold, fontSize: 14))
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
            .padding(.top, .topInsets + .screenWidth )
            
            
           
        }
        .onAppear {
            self.countryObj = Country(phoneCode: "+1" , isoCode: "")
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
