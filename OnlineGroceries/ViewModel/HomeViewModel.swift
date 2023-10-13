//
//  HomeViewModel.swift
//  OnlineGroceries
//
//  Created by William Rozier on 10/12/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int
    @Published var txtSearch: String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
  
}

//#Preview {
//    HomeViewModel()
//}
