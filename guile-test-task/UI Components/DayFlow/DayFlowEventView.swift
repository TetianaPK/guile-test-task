//
//  DayFlowEventView.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import SwiftUI

struct DayFlowEventView: View {
    let event: Event
    let cellHeight: CGFloat
    let hourRange: ClosedRange<Int>
    
    let calendar = Calendar.current
    
    var duration: Double {
        return event.endDate.timeIntervalSince(event.startDate)
    }
    
    var height: Double {
        return (duration / 60 / 60) * cellHeight
    }
    
    var offset: Double {
        let hourHeight = CGFloat(event.startDate.hour - hourRange.lowerBound) * cellHeight
        let minuteHeight = CGFloat(event.startDate.minute) / 60 * cellHeight
        
        return hourHeight + minuteHeight
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(event.title)
                .bold()
                .font(.caption2)
            
            if let subtitle = event.subtitle {
                Text(subtitle)
                    .foregroundStyle(.secondary)
            }
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .frame(height: height)
            .background {
                switch event.eventType {
                case .task:
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.green)
                        .stroke(.separator, lineWidth: 1)
                case .break:
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.separator, lineWidth: 1)
                        
                        Stripes(spacing: 25)
                            .stroke(.separator, lineWidth: 10)
                            .foregroundStyle(.separator)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 8)
                            )
                    }
                }
            }
            .offset(y: offset)
    }
}

#Preview {
    ZStack {
        DayFlowEventView(event: Event(eventType: .task,
                                      startDate: .dateFrom(hour: 0),
                                      endDate: .dateFrom(hour: 1),
                                      title: "Cuts and fades",
                                      subtitle: "Mike M."),
                         cellHeight: 69, hourRange: 0...24)
        
        DayFlowEventView(event: Event(eventType: .break,
                                      startDate: .dateFrom(hour: 2),
                                      endDate: .dateFrom(hour: 3),
                                      title: "Coffee break"),
                         cellHeight: 69, hourRange: 0...24)
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .padding()
}
