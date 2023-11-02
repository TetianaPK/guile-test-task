//
//  DayFlowCurrentTimeView.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import SwiftUI

struct DayFlowCurrentTimeView: View {
    var date: Date
    let cellHeight: CGFloat
    let hourRange: ClosedRange<Int>
    
    let calendar = Calendar.current
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    var offset: Double {
        let hourHeight = CGFloat(date.hour - hourRange.lowerBound) * cellHeight
        let minuteHeight = CGFloat(date.minute) / 60 * cellHeight
        
        return hourHeight + minuteHeight - 10.0
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(formattedDate)
                .font(.caption2)
                .monospacedDigit()
                .frame(width: 60, height: 20, alignment: .leading)
                .background {
                    Rectangle()
                        .fill(.background)
                        .blur(radius: 5)
                }
            
            Circle()
                .fill(.red)
                .frame(width: 8)
            
            Rectangle()
                .fill(.red)
                .frame(height: 1)
        }
        .offset(y: offset)
    }
}

#Preview {
    VStack() {
        DayFlowCurrentTimeView(date: Date.now, cellHeight: 69, hourRange: 8...18)
        Spacer()
    }
}
