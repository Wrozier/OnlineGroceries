//
//  MainViewModel.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/18/23.
// Will controll login

import SwiftUI

class MainViewModel: ObservableObject{
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtUsername: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserModel = UserModel(dict: [:] )
    
    init(){
        
        if( Utils.UDValueBool(key: Globs.userLogin))  {
            
            self.setUserData(uDict: Utils.UDValue(key: Globs.userPayload)  as? NSDictionary ?? [:])
            
            
        } else {
            
        }
        
        #if DEBUG
        txtUsername = "user6"
        txtEmail = "test@gmail.com"
        txtPassword = "12345"
        #endif
    }
    
    //MARK: ServiceCall
    
    func serviceCallLogin(){
        if(!txtEmail.isValidEmail) {
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
            
            
        }
        
        if(txtPassword.isEmpty) {
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
            
        }
        
        ServiceCall.post(parameter: ["email": txtEmail, "password": txtPassword, "service_token" : ""], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"{
                    
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
            
        }
    }
    
    
    func serviceCallSignUp(){
        if(txtUsername.isEmpty) {
            self.errorMessage = "please enter valid user"
            self.showError = true
            return
        }
        if(!txtEmail.isValidEmail) {
            self.errorMessage = "please enter valid email address"
            self.showError = true
            return
        }
        if(txtPassword.isEmpty) {
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
        }
        
        
        ServiceCall.post(parameter: ["username": txtUsername, "email": txtEmail, "password": txtPassword, "service_token" : ""], path: Globs.SV_SIGN_UP) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"{
                    
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
                
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
            
        }
    }
    func setUserData(uDict: NSDictionary){

        Utils.UDSET(data: uDict, key: Globs.userPayload)
        Utils.UDSET(data: true, key: Globs.userPayload)
        self.userObj = UserModel(dict: uDict)
        self.isUserLogin = true
        
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
        
    }
}

