//
//  OnlineGroceriesApp.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/17/23.
//

import SwiftUI

@main
struct OnlineGroceriesApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                    
                }
                
                
            }
        }
    }
}
