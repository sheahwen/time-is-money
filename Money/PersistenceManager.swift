//
//  PersistenceManager.swift
//  Money
//
//  Created by Sheah Wen Liaw on 18/8/24.
//

import Foundation

class PersistenceManager {
    static let shared = PersistenceManager()

    private let salaryKey = "monthlySalary"
    
    func saveSalary(_ salary: String) {
        UserDefaults.standard.set(salary, forKey: salaryKey)
    }
    
    func loadSalary() -> String {
        return UserDefaults.standard.string(forKey: salaryKey) ?? ""
    }
}
