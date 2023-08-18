//
//  CountryPickerUI.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/18/23.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {
    
    
    
    @Binding var country: Country?
    
    class  Coordinator: NSObject, CountryPickerDelegate{
    var parent: CountryPickerUI
    
        init (_ parent: CountryPickerUI) {
            self.parent = parent
            
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    
    }
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "US"
        countryPicker.delegate = context.coordinator
        return countryPicker
        }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
