//
//  ContentView.swift
//  Money
//
//  Created by Sheah Wen Liaw on 18/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var salaryData = SalaryData()
    @StateObject var dreamsData = DreamsData()
    @StateObject private var statusBarManager = StatusBarManager()
    
    @State private var isPinned: Bool = false
    
    var percentageAchieved: Double {
        let totalDreamCost = dreamsData.totalDreamCost
        if totalDreamCost > 0 {
            return salaryData.totalSalaryEarned / totalDreamCost
        } else {
            return 0.0
        }
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Form()
                
                Divider().padding(.top, 5)
                
                DreamsForm()
                
                Button(action: {
                    isPinned = true
                }) {
                    Text("Pin Progress to Status Bar")
                }
                .padding(.top, 5)
            }
            .frame(width: 350)
            .padding()
            .onAppear {
                salaryData.calculateTotalSalaryEarned()
                // Start timer to update salary every second
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    salaryData.calculateTotalSalaryEarned()
                    dreamsData.calculateTotalDreamCost()
                    
                    if isPinned {
                        let formattedTotalSalary = String(format: "$%.2f", salaryData.totalSalaryEarned)
                        let totalDreamCost = dreamsData.totalDreamCost
                        if totalDreamCost > 0 {
                            let percentageAchieved = salaryData.totalSalaryEarned / totalDreamCost
                            statusBarManager.updateStatusItem(with: formattedTotalSalary, progress: percentageAchieved)
                        } else {
                            statusBarManager.updateStatusItem(with: formattedTotalSalary)
                        }
                    }
                }
            }
        }
        .environmentObject(salaryData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("ContentView Preview")
    }
}

