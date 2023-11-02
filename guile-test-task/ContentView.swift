//
//  ContentView.swift
//  guile-test-task
//
//  Created by Coffee Bean on 02.11.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    @State var showsFilterView: Bool = false
    @State var sheetHeight: CGFloat = .zero
    
    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MMM d"
        
        return dateFormatter.string(from: Date.now)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    DayFlowView(content: viewModel.employees.filter({ employee in !viewModel.hiddenEmployees.contains(employee.id)
                    }), hourRange: 8...18)
                }
            }
            .navigationTitle(currentDateString)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showsFilterView = true
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    })
                }
            }
            .sheet(isPresented: $showsFilterView, content: {
                FilterSheetView(employees: viewModel.employees, hiddenEmployees: $viewModel.hiddenEmployees)
                    .modifier(GetHeightModifier(height: $sheetHeight))
                    .presentationDetents([.height(sheetHeight)])
                    .presentationDragIndicator(.visible)
            })
        }
    }
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var employees: [EmployeeSchedule] = DemoData.demoEmployees
        @Published var hiddenEmployees: Set<UUID> = []
    }
}

#Preview {
    ContentView()
}
