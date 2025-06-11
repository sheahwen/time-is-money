//
//  Data.swift
//  Money
//
//  Created by Sheah Wen Liaw on 25/8/24.
//

import Foundation
import SwiftUI

class SalaryData: ObservableObject {
    static let salaryData = SalaryData()
    
    @AppStorage("monthlySalary") var monthlySalary: String = "0.00"
    @AppStorage("startHour") var startHour: Int = 9
    @AppStorage("startMinute") var startMinute: Int = 30
    @AppStorage("endHour") var endHour: Int = 18
    @AppStorage("endMinute") var endMinute: Int = 30
    
    @Published var totalSalaryEarned: Double = 0.0
    
    var workingSeconds: TimeInterval {
        let startSeconds = TimeInterval(startHour * 3600 + startMinute * 60)
        let endSeconds = TimeInterval(endHour * 3600 + endMinute * 60)
        if startSeconds > endSeconds {return startSeconds - endSeconds} else {
            return endSeconds - startSeconds
        }
    }
    
    var salaryPerSecond: Double {
        if workingSeconds > 0, let salary = Double(monthlySalary) {
            return salary / workingSeconds
        } else {
            return 0.0
        }
    }
    
    func calculateTotalSalaryEarned() {
        guard let salary = Double(monthlySalary), workingSeconds > 0 else {
            totalSalaryEarned = 0.00
            return
        }
        
        let calendar = Calendar.current
        let now = Date()
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: now)?.count ?? 0
        
        if totalDaysInMonth > 0 {
            let dailySalary = salary / Double(totalDaysInMonth)
            let currentDay = calendar.component(.day, from: now)
            
            // Setting up today's times
            var startComponents = calendar.dateComponents([.year, .month, .day], from: now)
            startComponents.hour = startHour
            startComponents.minute = startMinute
            var startTimeToday = calendar.date(from: startComponents) ?? now
            
            var endComponents = startComponents
            endComponents.hour = endHour
            endComponents.minute = endMinute
            var endTimeToday = calendar.date(from: endComponents) ?? now
            
            // Overnight shift
            let startTotalMinutes = startHour * 60 + startMinute
            let endTotalMinutes = endHour * 60 + endMinute
            
            if endTotalMinutes <= startTotalMinutes {
                let startOfToday = calendar.startOfDay(for: now)
                if now > startOfToday.addingTimeInterval(0) {
                    startTimeToday = calendar.date(byAdding: .day, value: -1, to: startTimeToday) ?? startTimeToday
                } else {
                    endTimeToday = calendar.date(byAdding: .day, value: 1, to: endTimeToday) ?? endTimeToday
                }
            }
            
            // Calculate seconds worked today
            let isBeforeEndTime = now < endTimeToday
            let endOfCurrentWorkPeriod = isBeforeEndTime ? now : endTimeToday
            let secondsWorkedToday = max(0, endOfCurrentWorkPeriod.timeIntervalSince(startTimeToday))
            // Adjust daily calculation if the current time is after the end time
            let totalWorkableSeconds = endTimeToday.timeIntervalSince(startTimeToday)
  
            let salaryEarnedToday = (secondsWorkedToday / totalWorkableSeconds) * dailySalary
           
            // Adjust salary before today
            let daysBeforeToday = currentDay - 1
            let salaryEarnedBeforeToday = Double(daysBeforeToday) * dailySalary
            // Update total salary earned
            totalSalaryEarned = salaryEarnedBeforeToday + salaryEarnedToday
        }
    }
}

