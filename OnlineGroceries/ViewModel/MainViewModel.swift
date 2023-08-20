//
//  MainViewModel.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/18/23.
// Will controll login

import SwiftUI

class MainViewModel: ObservableObject{
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init(){
        #if DEBUG
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
                    print(response);
                    self.errorMessage =  response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
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
}

