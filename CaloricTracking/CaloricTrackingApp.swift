//
//  CaloricTrackingApp.swift
//  CaloricTracking
//
//  Created by Rafiul Hasan on 11/28/24.
//

import SwiftUI

@main
struct CaloricTrackingApp: App {
    
    @StateObject var vm: CDDataModel = CDDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
