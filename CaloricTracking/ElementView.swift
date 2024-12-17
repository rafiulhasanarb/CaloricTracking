//
//  ElementView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 12/6/24.
//

import SwiftUI

struct ElementView: View {
    
    var name = "Elements"
    var foodElement: CGFloat = 100
    var multipier: CGFloat = 0
    var color = ""
    
    var body: some View {
        let width: CGFloat = 130
        let multiplier: CGFloat = width / 200
        
        return VStack {
            Text(name)
                .font(.system(size: 12))
            
            Rectangle()
                .frame(width: foodElement * multiplier, height: 5)
                .cornerRadius(5)
                .foregroundStyle(Color(color))
                
        }
        .padding(.bottom, 5)
        .frame(width: 90)
    }
}

#Preview {
    ElementView()
}
