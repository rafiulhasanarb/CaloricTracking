//
//  CDDataModel.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 11/28/24.
//

import CoreData
import Foundation

class CDDataModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var saveBreakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CaloricTracking")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let breakfastRequest = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let lunchRequest = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let valueRequest = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        
        do {
            self.saveBreakfastEntity = try container.viewContext.fetch(breakfastRequest)
            self.saveLunchEntity = try container.viewContext.fetch(lunchRequest)
            self.saveValueEntity = try container.viewContext.fetch(valueRequest)
        } catch {
            print("Error fetching data from database: \(error)")
        }
    }
    
    func addBreakfast(icon: String, name: String, ingredients: String, fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newBreakfast = BreakfastEntity(context: container.viewContext)
        newBreakfast.icon = icon
        newBreakfast.name = name
        newBreakfast.ingredients = ingredients
        newBreakfast.fat = Float(fat)
        newBreakfast.protein = Float(protein)
        newBreakfast.cards = Float(cards)
        saveData()
    }
    
    func addLunch(icon: String, name: String, ingredients: String, fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newBreakfast = BreakfastEntity(context: container.viewContext)
        newBreakfast.icon = icon
        newBreakfast.name = name
        newBreakfast.ingredients = ingredients
        newBreakfast.fat = Float(fat)
        newBreakfast.protein = Float(protein)
        newBreakfast.cards = Float(cards)
        saveData()
    }
    
    func addValue(fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let value = try container.viewContext.fetch(newValue)
            if let entity = value.first {
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.cards += Float(cards)
            } else {
                let newValue = ValueEntity(context: container.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.cards = Float(cards)
            }
            saveData()
            fetchData()
        } catch {
            print("Error fetching data from database: \(error)")
        }
        
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch {
            print("Error saving data to database: \(error)")
        }
    }
    
}
