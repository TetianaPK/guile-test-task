//
//  Stripes.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import Foundation
import SwiftUI

struct Stripes: Shape {
    static let lineInset: CGFloat = 10
    
    let spacing: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        
        for x in stride(from: -Stripes.lineInset, through: width * 2, by: spacing) {
            path.move(to: CGPoint(x: x, y: -Stripes.lineInset))
            
            path.addLine(to: CGPoint(x: -Stripes.lineInset, y: x))
        }
        return path
    }
}
