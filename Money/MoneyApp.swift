//
//  MoneyApp.swift
//  Money
//
//  Created by Sheah Wen Liaw on 18/8/24.
//

import SwiftUI

@main
struct MoneyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

