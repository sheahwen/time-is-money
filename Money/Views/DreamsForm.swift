//
//  DreamsForm.swift
//  Money
//
//  Created by Sheah Wen Liaw on 25/8/24.
//

import SwiftUI

struct DreamsForm: View {
    @StateObject private var dreamsData = DreamsData()
    @State private var newDreamName: String = ""
    @State private var newDreamCost: String = ""
    
    @EnvironmentObject var salaryData: SalaryData
    @StateObject private var statusBarManager = StatusBarManager()
    
    var percentageAchieved: Double {
        guard dreamsData.totalDreamCost > 0 else { return 0 }
        return salaryData.totalSalaryEarned / dreamsData.totalDreamCost
    }
    
    var body: some View {
        VStack {
            ForEach(dreamsData.dreams.indices, id: \.self) { index in
                let dream = dreamsData.dreams[index]
                HStack {
                    Text(dream.name)
                    Spacer()
                    Text("$\(dream.cost, specifier: "%.2f")")
                    Button(action: {
                        dreamsData.removeDream(at: IndexSet(integer: index))
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    } .buttonStyle(PlainButtonStyle())
                }.padding(.top, 1)
            }
            
            HStack {
                TextField("Dream Name", text: $newDreamName)
                TextField("Cost", text: $newDreamCost)
                Button("Add") {
                    dreamsData.addDream(name: newDreamName, cost: newDreamCost)
                    newDreamCost = ""
                    newDreamName = ""
                }
            }.padding(.top, 3)
            
            Text("Your dream(s) cost $\(dreamsData.totalDreamCost, specifier: "%.2f")")
                .padding(.bottom, 3)
            
            ProgressView(value: percentageAchieved, total: 1.0) {
                Text("Progress towards dreams")
            } currentValueLabel: {
                Text("\(percentageAchieved * 100, specifier: "%.1f")%")
            }
            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
            .cornerRadius(4.0)
            
            HStack {
                Circle().fill(Color.blue).frame(width: 10, height: 10)
                Text("Achieved")
                Spacer()
                Circle().fill(Color.gray.opacity(0.3)).frame(width: 10, height: 10)
                Text("Remaining")
            }
            .padding(.top , 1)
        }
    }
}

#Preview {
    DreamsForm()
}
