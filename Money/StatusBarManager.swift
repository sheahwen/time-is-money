//
//  StatusBarManager.swift
//  Money
//
//  Created by Sheah Wen Liaw on 18/8/24.
//

import SwiftUI

class StatusBarManager: ObservableObject {
    private var statusItem: NSStatusItem?
    
    init() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    }
    
    func updateStatusItem(with salary: String, progress: Double? = nil) {
        if let button = statusItem?.button {
            if let progress = progress {
                let progressBar = generateProgressBar(progress: progress, length: 10)
                button.title = "\(salary) earned so far \(progressBar)"
            } else {
                button.title = "\(salary) earned so far"
            }
        }
    }
    
    private func generateProgressBar(progress: Double, length: Int) -> String {
        let filledLength = Int(progress * Double(length))
        let emptyLength = length - filledLength
        
        let filledPart = String(repeating: "▓", count: filledLength)
        let emptyPart = String(repeating: "░", count: emptyLength)
        let percentage = String(format: "%.1f%%", progress * 100)
          return "[\(filledPart)\(emptyPart)] \(percentage)"
      }
}
