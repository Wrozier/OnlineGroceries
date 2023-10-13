//
//  MainTabView.swift
//  OnlineGroceries
//
//  Created by William Rozier on 10/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack{
            
            VStack{
//                Spacer()
                
                HStack {
                    Button {
                        MainViewModel.shared.isUserLogin = false
                    } label: {
                        Text("Logout")
                    }
                    
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
