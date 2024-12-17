//
//  TabView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 12/13/24.
//

import SwiftUI

enum Tab: String {
    case Breakfast
    case Lunch
    case Dinner
    case Snacks
    //case Profile
}

struct foodSelected: Identifiable {
    let id = UUID()
    let food: String
    let tab:  Tab
}

var selectedTab: [foodSelected] = [
    foodSelected(food: "Breakfast", tab: .Breakfast),
    foodSelected(food: "Lunch", tab: .Lunch),
    foodSelected(food: "Dinner", tab: .Dinner),
    foodSelected(food: "Snacks", tab: .Snacks),
    //foodSelected(food: "Profile", tab: .Profile),
]

struct TabView: View {
    
    @Binding var itemSelected: Tab
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(selectedTab) { item in
                Button(action: {
                    withAnimation {
                        itemSelected = item.tab
                    }
                }) {
                    Text(item.food)
                        .foregroundStyle(itemSelected == item.tab ? .white : .black)
                        .padding(8)
                        .background(itemSelected == item.tab ? .black : Color(""))
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    TabView(itemSelected: .constant(.Breakfast))
}
