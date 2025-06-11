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
    
    private let weekdays = [
        (1, "Monday"),
        (2, "Tuesday"),
        (3, "Wednesday"),
        (4, "Thursday"),
        (5, "Friday"),
        (6, "Saturday"),
        (7, "Sunday")
    ]
    
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
                Text("Work Days:")
                    .font(.headline)
                Spacer()
                Menu {
                    ForEach(weekdays, id: \.0) { day in
                        Button(action: {
                            if salaryData.workDays.contains(day.0) {
                                salaryData.workDays.removeAll { $0 == day.0 }
                            } else {
                                salaryData.workDays.append(day.0)
                                salaryData.workDays.sort()
                            }
                        }) {
                            HStack {
                                if salaryData.workDays.contains(day.0) {
                                    Image(systemName: "checkmark")
                                }
                                Text(day.1)
                            }
                        }
                    }
                } label: {
                    HStack {
                        Text(salaryData.workDays.isEmpty ? "Select Days" : 
                            salaryData.workDays.map { weekdays[$0-1].1 }.joined(separator: ", "))
                            .foregroundColor(salaryData.workDays.isEmpty ? .gray : .primary)
                    }
                    .frame(width: 150)
                    .padding(8)
                    .background(Color(.textBackgroundColor))
                    .cornerRadius(6)
                }.frame(width: 150)
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
