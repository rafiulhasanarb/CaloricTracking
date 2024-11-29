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
    
    var body: some View {
        let ringValue = vm.saveValueEntity.first
        let progress = 1 - (ringValue?.ring ?? 0 / 1000)
        return HStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                    .frame(width: width, height: height)
                
                Circle()
                    .trim(from: CGFloat(progress))
                    .stroke(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.5), .blue]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: CGLineJoin.round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                
                Text("1790")
                    .bold()
                    .font(.title)
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
