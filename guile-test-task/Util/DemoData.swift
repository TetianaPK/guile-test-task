//
//  DemoData.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import Foundation

class DemoData {
    static let demoEmployees: [EmployeeSchedule] = [
        EmployeeSchedule(name: "John", events: [
            Event(eventType: .task, startDate: .dateFrom(hour: 8), endDate: .dateFrom(hour: 9), title: "Mid taper", subtitle: "Mike M."),
            Event(eventType: .task, startDate: .dateFrom(hour: 9), endDate: .dateFrom(hour: 10), title: "Mid taper", subtitle: "Antwaan H."),
            Event(eventType: .break, startDate: .dateFrom(hour: 10), endDate: .dateFrom(hour: 11), title: "Coffee break"),
            Event(eventType: .task, startDate: .dateFrom(hour: 11), endDate: .dateFrom(hour: 12), title: "Mid taper", subtitle: "John B."),
            Event(eventType: .task, startDate: .dateFrom(hour: 12), endDate: .dateFrom(hour: 13), title: "Men's haircut", subtitle: "Alex W."),
        ]),
        EmployeeSchedule(name: "Brian", events: [
            Event(eventType: .task, startDate: .dateFrom(hour: 9), endDate: .dateFrom(hour: 10), title: "Mid taper", subtitle: "Mike M."),
            Event(eventType: .task, startDate: .dateFrom(hour: 10), endDate: .dateFrom(hour: 11), title: "Mid taper", subtitle: "Antwaan H."),
            Event(eventType: .break, startDate: .dateFrom(hour: 11), endDate: .dateFrom(hour: 12), title: "Coffee break"),
            Event(eventType: .task, startDate: .dateFrom(hour: 12), endDate: .dateFrom(hour: 13), title: "Mid taper", subtitle: "John B."),
            Event(eventType: .task, startDate: .dateFrom(hour: 13), endDate: .dateFrom(hour: 14), title: "Men's haircut", subtitle: "Alex W."),
        ]),
        EmployeeSchedule(name: "Mike", events: [
            Event(eventType: .task, startDate: .dateFrom(hour: 8), endDate: .dateFrom(hour: 9), title: "Mid taper", subtitle: "Mike M."),
            Event(eventType: .break, startDate: .dateFrom(hour: 9), endDate: .dateFrom(hour: 10), title: "Coffee break"),
            Event(eventType: .task, startDate: .dateFrom(hour: 11), endDate: .dateFrom(hour: 12), title: "Men's haircut", subtitle: "Alex W."),
        ])
    ]
}
