//
//  Form.swift
//  Money
//
//  Created by Sheah Wen Liaw on 25/8/24.
//

import SwiftUI

struct Form: View {
    @EnvironmentObject var salaryData: SalaryData
    @StateObject private var statusBarManager = StatusBarManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Monthly Salary:")
                    .font(.headline)
                Spacer()
                TextField("Salary", text: $salaryData.monthlySalary)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
            }
            .padding(.vertical, 5)
            
            HStack {
                Text("Start Time:")
                    .font(.headline)
                Spacer()
                Picker("", selection: $salaryData.startHour) {
                    ForEach(0..<24, id: \.self) { hour in
                        Text("\(hour) hr")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80)
                
                Picker("", selection: $salaryData.startMinute) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute) min")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80)
            }
            .padding(.vertical, 5)
            
            HStack {
                Text("End Time:")
                    .font(.headline)
                Spacer()
                Picker("", selection: $salaryData.endHour) {
                    ForEach(0..<24, id: \.self) { hour in
                        Text("\(hour) hr")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80)
                
                Picker("", selection: $salaryData.endMinute) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute) min")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80)
            }
            .padding(.vertical, 5)
            
            HStack {
                Text("Salary Earned Per Second:")
                Spacer()
                Text("\(salaryData.salaryPerSecond, specifier: "$%.6f")")
            }
            .padding(.vertical, 5)
            
            HStack {
                Text("Total Salary Earned:")
                Spacer()
                Text("\(String(format: "$%.2f", salaryData.totalSalaryEarned))")
            }
            .padding(.vertical, 5)
        }
    }
}

#Preview {
    Form()
}
