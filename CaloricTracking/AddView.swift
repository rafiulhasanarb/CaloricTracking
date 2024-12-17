//
//  AddView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 12/8/24.
//

import SwiftUI

struct meal: Identifiable {
    var id = UUID()
    var image: String
}

var icons: [meal] = [
    meal(image: "chopsticks"),
    meal(image: "bief"),
    meal(image: "burger"),
    meal(image: "cream"),
    meal(image: "donuts"),
    meal(image: "fish"),
    meal(image: "hamburger"),
    meal(image: "hotdog"),
    meal(image: "piza")
    ]

struct AddView: View {
    
    @Environment(\.presentationMode) var envi
    @EnvironmentObject var vm: CDDataModel
    @State var itemSelected: Tab = .Breakfast
    @State var showicon: Bool = false
    @State var icon: String = "plus.circle"
    @State var name: String = ""
    @State var title: String = ""
    @State var fat: String = "0"
    @State var protein: String = "0"
    @State var cards: String = "0"
    @State var fatTF: Bool = false
    @State var proteinTF: Bool = false
    @State var cardsTF: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            TabView(itemSelected: $itemSelected)
            
            VStack(spacing: 20) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        withAnimation { showicon.toggle() }
                    }
                
                if showicon {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(icons) { item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        icon = item.image
                                        withAnimation { showicon.toggle() }
                                    }
                            }
                        }
                    }
                }
                
                VStack {
                    TextField("name", text: $name)
                    Divider()
                    TextField("title", text: $title)
                }
                .font(.title3)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .modifier(CustomShadow())
                
                VStack {
                    Values(number: $fat, show: $fatTF, name: "Fat")
                    Values(number: $protein, show: $proteinTF, name: "Protein")
                    Values(number: $cards, show: $cardsTF, name: "Cards")
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .modifier(CustomShadow())
                
                Button {
                    switch itemSelected {
                    case .Breakfast:
                        vm.addBreakfast(icon: icon, name: name, ingredients: title, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), cards: CGFloat(Int(cards) ?? 0))
                        envi.wrappedValue.dismiss()
                    case .Lunch:
                        vm.addLunch(icon: icon, name: name, ingredients: title, fat: CGFloat(Int(fat) ?? 0), protein: CGFloat(Int(protein) ?? 0), cards: CGFloat(Int(cards) ?? 0))
                        envi.wrappedValue.dismiss()
                        print("lunch")
                    case .Dinner:
                        envi.wrappedValue.dismiss()
                        print("dinner")
                    case .Snacks:
                        envi.wrappedValue.dismiss()
                        print("snacks")
                    }
                } label: {
                    Text("Save")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: 180, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .modifier(CustomShadow())
                }

            }
            .padding()
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                envi.wrappedValue.dismiss()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.black)
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                }
                .modifier(CustomShadow())
                .padding()
            }

        }
    }
}

#Preview {
    AddView()
        .environmentObject(CDDataModel())
}

struct Values: View {
    
    @Binding var number: String
    @Binding var show: Bool
    var name: String = ""
    
    var body: some View {
        HStack {
            Text(name)
                .bold()
                .font(.title2)
            
            Spacer()
            
            Text("\(number)")
                .bold()
                .font(.title2)
                .frame(width: 40, height: 30)
                .background(.black)
                .cornerRadius(5)
                .foregroundStyle(.white)
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
            
            if show {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(0..<100) { item in
                            Text("\(item)")
                                .bold()
                                .frame(width: 30, height: 30)
                                .background(.black.opacity(0.2))
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation {
                                        show.toggle()
                                        number = "\(item)"
                                    }
                                }
                        }
                    }
                }
                .frame(width: 220, height: 30)
            }
        }
        .padding(6)
    }
}
