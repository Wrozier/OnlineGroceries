//
//  UIKitExtension.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/19/23.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCH %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
