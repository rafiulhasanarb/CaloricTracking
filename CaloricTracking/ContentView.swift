//
//  ContentView.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 11/28/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var vm: CDDataModel
    @State var itemSelected: Tab = .Breakfast
    @State var show = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Caloric Tracking")
                        .bold()
                        .font(.system(size: 36))
                    Spacer()
                    Image("burger")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                
                RingView()
                
                TabView(itemSelected: $itemSelected)
                
                if itemSelected == .Breakfast {
                    ScrollView {
                        HStack(spacing: 10) {
                            ForEach(vm.saveBreakfastEntity) { item in
                                FoodCardView(width: 200, cards: CGFloat(item.cards), protein: CGFloat(item.protein), fat: CGFloat(item.fat), name: item.name ?? "", title: item.ingredients ?? "", icon: item.icon ?? "")
                                    .padding(.leading)
                                /*
                                    .overlay(alignment: .topTrailing) {
                                        Button(action: {
                                            vm.addValue(fat: CGFloat(item.fat), protein: CGFloat(item.protein), cards: CGFloat(item.cards))
                                            vm.addmeal(meal: item)
                                            vm.addringCalories(calories: CGFloat(item.cards))
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.white)
                                                
                                                Image(systemName: item.addmeal ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundColor(.black)
                                            }
                                            .modifier(CustomShadow())
                                        }
                                        .offset(x: -5, y: 5)
                                    }
                                 */
                            }
                        }
                        .frame(height: 180)
                    }
                    .offset(y: -30)
                }/*                else if itemSelected == .Lunch {
                    ScrollView {
                        HStack(spacing: 10) {
                            ForEach(vm.saveLunchEntity) { item in
                                FoodCardView(width: 200, cards: CGFloat(item.cards), protein: CGFloat(item.protein), fat: CGFloat(item.fat), name: item.name ?? "", title: item.ingredients ?? "", icon: item.icon ?? "")
                                    .padding(.leading)
                                /*
                                    .overlay(alignment: .topTrailing) {
                                        Button(action: {
                                            show.toggle()
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.white)
                                                
                                                Image(systemName: item.addmeal ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundColor(.black)
                                            }
                                            .modifier(CustomShadow())
                                        }
                                        .offset(x: -5, y: 5)
                                    }
                                */
                            }
                        }
                        .frame(height: 180)
                    }
                    .offset(y: -30)
                }
                */
                WaterView()
                    .offset(y: -60)
                Spacer()
                    .overlay(alignment: .bottomLeading) {
                        Button(action: {
                            show.toggle()
                        }) {
                            Text("New Meal")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(width: 150, height: 50)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .modifier(CustomShadow())
                        }
                        .padding()
                    }
                    .sheet(isPresented: .constant(show)) {
                        AddView()
                    }
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CDDataModel())
}
