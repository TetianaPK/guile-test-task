//
//  Date+Ext.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import Foundation

extension Date {
    static func dateFrom(hour: Int, minute: Int = 0) -> Date {
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        
        return calendar.date(from: dateComponents) ?? .now
    }
    
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }
}
