//
//  Dreams.swift
//  Money
//
//  Created by Sheah Wen Liaw on 21/8/24.
//

import SwiftUI

struct Dream: Identifiable, Codable {
    let id = UUID()
    var name: String
    var cost: Double
}

class DreamsData: ObservableObject {
    @Published var dreams: [Dream] = []
    @Published var totalDreamCost: Double = 0.0
    
    init() {
        loadDreams()
    }
    
    func addDream(name: String, cost: String) {
        guard let price = Double(cost) else {
            return
        }
        let newDream = Dream(name: name, cost: price)
        dreams.append(newDream)
        saveDreams()
    }
    
    func removeDream(at offsets: IndexSet) {
        dreams.remove(atOffsets: offsets)
        saveDreams()
    }
    
    private func saveDreams() {
        if let encoded = try? JSONEncoder().encode(dreams) {
            UserDefaults.standard.set(encoded, forKey: "Dreams")
        }
    }
    
    private func loadDreams() {
        if let dreamsData = UserDefaults.standard.data(forKey: "Dreams"),
           let loadedDreams = try? JSONDecoder().decode([Dream].self, from: dreamsData) {
            dreams = loadedDreams
            // Calculate the initial totalDreamCost after loading the dreams
            totalDreamCost = dreams.reduce(0) { $0 + $1.cost }
        }
    }
    
    func calculateTotalDreamCost() {
          totalDreamCost = dreams.reduce(0) { $0 + $1.cost }
      }
}

