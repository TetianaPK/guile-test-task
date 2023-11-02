//
//  FilterSheetView.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import SwiftUI

struct FilterSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    let employees: [EmployeeSchedule]
    @Binding var hiddenEmployees: Set<UUID>
    
    var employeeIDs: Set<UUID> {
        Set(employees.map({ $0.id }))
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Filter")
                    .bold()
                    .font(.title)
                Spacer()
            }
            
            HStack {
                if hiddenEmployees.contains(where: employeeIDs.contains) {
                    Button(action: {
                        hiddenEmployees = []
                    }, label: {
                        Text("All")
                    })
                    .buttonStyle(.bordered)
                } else {
                    Button(action: {
                        for employee in employees {
                            hiddenEmployees.insert(employee.id)
                        }
                    }, label: {
                        Text("All")
                    })
                    .buttonStyle(.borderedProminent)
                }
                
                ForEach(employees) { employee in
                    if hiddenEmployees.contains(employee.id) {
                        Button(action: {
                            hiddenEmployees.remove(employee.id)
                        }, label: {
                            Text(employee.name)
                        })
                        .buttonStyle(.bordered)
                    } else {
                        Button(action: {
                            hiddenEmployees.insert(employee.id)
                        }, label: {
                            Text(employee.name)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Spacer()
            }
            .padding(.vertical)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("Close")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    FilterSheetView(employees: [
        EmployeeSchedule(name: "John", events: [], hidden: true),
        EmployeeSchedule(name: "Brian", events: []),
        EmployeeSchedule(name: "Mike", events: []),
    ], hiddenEmployees: .constant([]))
}
