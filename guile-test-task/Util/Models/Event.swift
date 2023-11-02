//
//  Event.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import Foundation

struct Event: Identifiable {
    enum EventType {
        case task
        case `break`
    }
    
    var id: UUID { .init() }
    var eventType: EventType
    
    var startDate: Date
    var endDate: Date
    
    var title: String
    var subtitle: String?
}
