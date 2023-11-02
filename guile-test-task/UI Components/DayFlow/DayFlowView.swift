//
//  DayFlowView.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import SwiftUI

struct DayFlowView: View {
    
    let content: [EmployeeSchedule]
    
    let hourRange: ClosedRange<Int>
    
    let cellHeight: CGFloat = 69
    
    private let timer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common).autoconnect()
    
    @State private var currentDate: Date = Date.now
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 65)
                
                ForEach(Array(content.enumerated()), id: \.offset) { index, employee in
                    if index > 0 {
                        Rectangle()
                            .fill(.separator)
                            .frame(width: 1)
                    }
                    
                    VStack(spacing: 0) {
                        HStack() {
                            Image(systemName: "person")
                                .padding(8)
                            Text(employee.name)
                            Spacer()
                        }
                        .frame(height: 56)
                        
                        Rectangle()
                            .fill(.separator)
                            .frame(height: 1)
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 56)
                
                ScrollView {
                    ZStack(alignment: .topTrailing) {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                ForEach(hourRange, id: \.self) { hour in
                                    ZStack {
                                        Text(string(for: hour) ?? "")
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                            .monospacedDigit()
                                            .frame(width: 65, height: 20, alignment: .leading)
                                    }
                                    .frame(height: cellHeight, alignment: .top)
                                }
                            }
                            
                            ZStack {
                                VStack(spacing: 0) {
                                    ForEach(hourRange, id: \.self) { hour in
                                        ZStack {
                                            Rectangle()
                                                .fill(.separator)
                                                .frame(height: 1)
                                        }
                                        .frame(height: cellHeight, alignment: .top)
                                    }
                                }
                                
                                HStack(spacing: 0) {
                                    ForEach(content) { employee in
                                        ZStack {
                                            ForEach(employee.events) { event in
                                                DayFlowEventView(event: event, 
                                                                 cellHeight: cellHeight,
                                                                 hourRange: hourRange)
                                            }
                                            .frame(maxHeight: .infinity, alignment: .top)
                                        }
                                    }
                                }
                            }
                        }
                        
                        DayFlowCurrentTimeView(date: currentDate,
                                               cellHeight: cellHeight,
                                               hourRange: hourRange)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .clipped()
        .onReceive(timer) { _ in
            currentDate = Date.now
        }
    }
    
    private func string(for hour: Int) -> String? {
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        if let date = Calendar.current.date(from: dateComponents) {
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
}

#Preview {
    DayFlowView(content: [
        EmployeeSchedule(name: "John", events: [
            Event(eventType: .task, startDate: .dateFrom(hour: 8), endDate: .dateFrom(hour: 9), title: "Mid taper", subtitle: "Mike M."),
            Event(eventType: .task, startDate: .dateFrom(hour: 9), endDate: .dateFrom(hour: 10), title: "Mid taper", subtitle: "Antwaan H."),
            Event(eventType: .break, startDate: .dateFrom(hour: 10), endDate: .dateFrom(hour: 11), title: "Coffee break"),
            Event(eventType: .task, startDate: .dateFrom(hour: 11), endDate: .dateFrom(hour: 12), title: "Mid taper", subtitle: "John B."),
            Event(eventType: .task, startDate: .dateFrom(hour: 12), endDate: .dateFrom(hour: 13), title: "Men's haircut", subtitle: "Alex W."),
        ]),
        EmployeeSchedule(name: "Brian", events: [
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 9),
                  endDate: .dateFrom(hour: 10),
                  title: "Mid taper",
                  subtitle: "Mike M."),
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 10),
                  endDate: .dateFrom(hour: 11),
                  title: "Mid taper",
                  subtitle: "Antwaan H."),
            Event(eventType: .break, 
                  startDate: .dateFrom(hour: 11),
                  endDate: .dateFrom(hour: 12),
                  title: "Coffee break"),
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 12),
                  endDate: .dateFrom(hour: 13),
                  title: "Mid taper",
                  subtitle: "John B."),
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 13),
                  endDate: .dateFrom(hour: 14),
                  title: "Men's haircut",
                  subtitle: "Alex W."),
        ]),
        EmployeeSchedule(name: "Mike", events: [
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 8),
                  endDate: .dateFrom(hour: 9),
                  title: "Mid taper",
                  subtitle: "Mike M."),
            Event(eventType: .break, 
                  startDate: .dateFrom(hour: 9),
                  endDate: .dateFrom(hour: 10),
                  title: "Coffee break"),
            Event(eventType: .task, 
                  startDate: .dateFrom(hour: 11),
                  endDate: .dateFrom(hour: 12),
                  title: "Men's haircut",
                  subtitle: "Alex W."),
        ]),
    ], hourRange: 8...18)
}
