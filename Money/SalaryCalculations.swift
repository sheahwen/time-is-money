//
//  SalaryCalculations.swift
//  Money
//
//  Created by Sheah Wen Liaw on 21/8/24.
//

import SwiftUI

extension ContentView {
    
    // Change fileprivate to internal to make these functions accessible throughout the module
    internal func calculateSalaryPerSecond() {
        guard let salary = Double(monthlySalary),
              let days = Double(workingDaysPerMonth),
              days > 0 else {
            salaryPerSecond = 0.0
            return
        }
        
        let workingSeconds = endTime.timeIntervalSince(startTime)
        
        if workingSeconds > 0 {
            let dailySalary = salary / days
            salaryPerSecond = dailySalary / workingSeconds
        } else {
            salaryPerSecond = 0.0
        }
    }
    
    internal func calculateTotalSalaryEarned() {
        guard let salary = Double(monthlySalary),
              let days = Double(workingDaysPerMonth),
              days > 0 else {
            totalSalaryEarned = 0.0
            return
        }
        
        let workingSeconds = endTime.timeIntervalSince(startTime)
        let dailySalary = salary / days
        let currentDay = Calendar.current.component(.day, from: Date())
        let now = Date()
        let secondsWorkedToday = max(0, min(workingSeconds, now.timeIntervalSince(startTime)))
        let salaryEarnedToday = (secondsWorkedToday / workingSeconds) * dailySalary
        let salaryEarnedBeforeToday = Double(currentDay - 1) * dailySalary
        totalSalaryEarned = salaryEarnedBeforeToday + salaryEarnedToday
    }
}
