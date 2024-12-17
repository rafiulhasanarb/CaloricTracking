//
//  RingView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 11/29/24.
//

import SwiftUI

struct CustomShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct RingView: View {
    
    @EnvironmentObject var vm: CDDataModel
    var parcent: CGFloat = 50
    var width: CGFloat = 130
    var height: CGFloat = 130
    var percent: CGFloat = 1000
    
    var body: some View {
        let ringValue = vm.saveValueEntity.first
        let multiplier  = width / 44
        let progress = 1 - (percent / 1700)
        return HStack(spacing: 40) {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 4 * multiplier))
                    .frame(width: width, height: height)
                
                Circle()
                    .trim(from: CGFloat(Int(progress)))
                    .stroke(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.5), .blue]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: CGLineJoin.round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                
                Text("1790")
                    .bold()
                    .font(.title)
            }
            /*
            HStack(spacing: 30) {
                ForEach(vm.saveValueEntity) { item in
                    FoodElementValue(element: "Cards", gram: String(format: "%.0f", item.cards), color: "cards")
                    FoodElementValue(element: "Fat", gram: String(format: "%.0f", item.fat), color: "fat")
                    FoodElementValue(element: "Protein", gram: String(format: "%.0f", item.protein), color: "protein")
                }
                FoodElementValue(element: "Cards", gram: String(format: "%.0f", ""), color: "cards", elementValue: 200)
            }
             */
            HStack(spacing: 30) {
                FoodElementValue(element: "Cards", gram: String(format: "%.0f", ""), color: "cards", elementValue: 800)
                FoodElementValue(element: "Fat", gram: String(format: "%.0f", ""), color: "fat", elementValue: 1000)
                FoodElementValue(element: "Protein", gram: String(format: "%.0f", ""), color: "protein", elementValue: 400)
            }
        }
        .frame(height: 180)
        .frame(width: UIScreen.main.bounds.width - 20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

#Preview {
    RingView()
        .environmentObject(CDDataModel())
}

struct FoodElementValue: View {
    
    var element = ""
    var gram = ""
    var color = ""
    var elementValue: CGFloat = 0
    
    var body: some View {
        let height: CGFloat = 130
        let multiplier = height / 2000
        
        return VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundStyle(.gray.opacity(0.5))
                
                if elementValue != 0 {
                    Rectangle()
                        .frame(width: 8, height: elementValue * multiplier)
                        .foregroundStyle(Color(color))
                } else {
                    Rectangle()
                        .frame(width: 8, height: 110)
                        .foregroundStyle(Color(color))
                }
            }
            .cornerRadius(10)
            
            Text(element)
                .font(.system(size: 12))
            Text(gram)
                .font(.system(size: 10))
        }
    }
}
