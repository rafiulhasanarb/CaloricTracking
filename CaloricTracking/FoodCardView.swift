//
//  FoodCardView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 12/6/24.
//

import SwiftUI

struct FoodCardView: View {
    
    var width: CGFloat = 200
    @State var cards: CGFloat = 60
    @State var protein: CGFloat = 80
    @State var fat: CGFloat = 70
    @State var name: String = ""
    @State var title: String = ""
    @State var icon: String = ""
    
    var body: some View {
        let multiplier: CGFloat = width / 40
        return VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(name)
                    .font(.title2)
                    .frame(width: 160)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            .bold()
            
            HStack {
                Text(title)
                Spacer()
            }
            .frame(width: 200, height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20, y: -20)
        .frame(width: 270, height: 110)
        .background(Color.white)
        .cornerRadius(10)
        .modifier(CustomShadow())
        .overlay(alignment: .topLeading) {
            Image("burger")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .offset(x: -12, y: -16)
        }
        .overlay(alignment: .bottom) {
            HStack {
                ElementView(name: "cards", foodElement: cards, multipier: multiplier, color: "cards")
                ElementView(name: "fat", foodElement: fat, multipier: multiplier, color: "fat")
                ElementView(name: "protein", foodElement: protein, multipier: multiplier, color: "protein")
            }
        }
    }
}

#Preview {
    FoodCardView()
}
