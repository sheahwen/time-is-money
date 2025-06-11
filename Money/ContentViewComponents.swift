//
//  ContentViewComponents.swift
//  Money
//
//  Created by Sheah Wen Liaw on 21/8/24.
//

import SwiftUI

struct SalaryInputField: View {
    let label: String
    @Binding var value: String
    var onChange: () -> Void
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            TextField("", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
                .onChange(of: value) { _ in
                    onChange()
                }
        }
        .padding(.vertical, 5)
    }
}

struct TimePickerField: View {
    let label: String
    @Binding var selection: Date
    var onChange: () -> Void
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            DatePicker("", selection: $selection, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .onChange(of: selection) { _ in
                    onChange()
                }
        }
        .padding(.vertical, 5)
    }
}
