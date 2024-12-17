//
//  WaterView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 12/6/24.
//

import SwiftUI

struct WaterView: View {
    
    @State var checkmark: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("6 of 6 classes")
                    .bold()
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Image("cup")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 45)
            }
            .padding(.horizontal)
            
            HStack {
                ForEach(0..<6) { item in
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue.opacity(checkmark ? 0.1 : 0.3))
                        
                        HStack {
                            Image("waterdrop")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    checkmark.toggle()
                                }
                        }
                    }
                    .overlay(alignment: .topTrailing) {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 15, height: 15)
                            Image(systemName: checkmark ? "checkmark" : "")
                                .bold()
                                .foregroundStyle(.green)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .modifier(CustomShadow())
    }
}

#Preview {
    WaterView()
}
