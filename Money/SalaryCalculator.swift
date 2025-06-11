//
//  SalaryCalculator.swift
//  Money
//
//  Created by Sheah Wen Liaw on 21/8/24.
//

import Foundation

struct SalaryCalculator {
    
    static func calculateSalaryPerSecond(monthlySalary: String, startTime: Date, endTime: Date) -> Double {
        guard let salary = Double(monthlySalary) else {
            return 0.0
        }
        
        let workingDays = calculateWorkingDaysInMonth()
        let workingSeconds = endTime.timeIntervalSince(startTime)
        
        if workingSeconds > 0 {
            let dailySalary = salary / Double(workingDays)
            return dailySalary / workingSeconds
        } else {
            return 0.0
        }
    }
    
    static func calculateTotalSalaryEarned(monthlySalary: String, startTime: Date, endTime: Date) -> Double {
        guard let salary = Double(monthlySalary) else {
            return 0.0
        }
        
        let workingDays = calculateWorkingDaysInMonth()
        let workingSeconds = endTime.timeIntervalSince(startTime)
        let dailySalary = salary / Double(workingDays)
        
        let currentDay = Calendar.current.component(.day, from: Date())
        let now = Date()
        let secondsWorkedToday = max(0, min(workingSeconds, now.timeIntervalSince(startTime)))
        
        let salaryEarnedToday = (secondsWorkedToday / workingSeconds) * dailySalary
        let salaryEarnedBeforeToday = Double(currentDay - 1) * dailySalary
        
        return salaryEarnedBeforeToday + salaryEarnedToday
    }
    
    private static func calculateWorkingDaysInMonth() -> Int {
        return Date().calculateWorkingDaysInMonth()
    }
}
