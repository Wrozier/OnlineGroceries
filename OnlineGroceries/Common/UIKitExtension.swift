//
//  UIKitExtension.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/19/23.
//

import Foundation

extension String {
    //For Email Validation
    var isValidEmail: Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")

        return emailPredicate.evaluate(with: self)
    }
    
    
    func stringDateToDate(format:String = "yyy-MM-dd'THH:mn:ss.SSSZ") -> Date? {
        let dataFromat = DateFormatter()
        dataFromat.dateFormat = format
        return dataFromat.date(from: self)
    }
    
    func stringDateChangeFromat(format: String, newFormat: String) -> String {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        if let dt = dataFormat.date(from: self) {
            dataFormat.dateFormat = newFormat
            return dataFormat.string(from: dt)
        } else {
            return ""
        }
        
    }
    
}

extension Date {
    func displayDate(format: String , addMinTime: Int = 0) -> String {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        let date = self.addingTimeInterval(TimeInterval(60 * addMinTime))
        return dataFormat.string(from: date)
    }
}
