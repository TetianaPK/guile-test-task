//
//  Employee.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import Foundation

struct EmployeeSchedule: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    
    var events: [Event] = []
    
    var hidden: Bool = false
}
