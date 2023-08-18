//
//  RoundButton.swift
//  OnlineGroceries
//
//  Created by William Rozier on 8/17/23.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        
        Button {
            didTap?()
        } label: {
            Text ("Get Started")
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
        .background(Color.primaryApp)
        .cornerRadius(20)
        
        
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
