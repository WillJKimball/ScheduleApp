//
//  Goals.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//

import SwiftUI

class GoalsViewModel: ObservableObject {
    @Published var goals: [String] = []
    
    func addGoal(_ goal: String, priority: String) {
        goals.append("\(goal), \(priority)")
    }
    
    func deleteGoal(at index: Int) {
        goals.remove(at: index)
    }
}

struct Goals: View {
    @ObservedObject var goalsViewModel = GoalsViewModel()
    @State private var newGoal: String = ""
    @State private var newPriority: String = ""
    var body: some View {
        ZStack{
            Color(customColor2)
                .ignoresSafeArea()
            VStack {
                Text("Goals") // Title for your view
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                CircleImage()
                Spacer()
                HStack {
                    DropDownBar()
                        .padding()
                    VStack{
                        TextField("Enter goal", text: $newGoal)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        TextField("Enter priority", text: $newPriority)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                }
                Button(action: addItem) {
                    Text("Add Item")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                
                List {
                    ForEach(goalsViewModel.goals, id: \.self) { item in
                        Text(item)
                        .listRowBackground(customColor5)
                    }
                    .onDelete(perform: deleteGoal)
                    .listRowSeparatorTint(Color.black)
                }
            }
        }
        var customColor2: Color {
                let redValue: Double = 0.25 // Red component (between 0 and 1)
                let greenValue: Double = 0.65 // Green component (between 0 and 1)
                let blueValue: Double = 0.25 // Blue component (between 0 and 1)
                let opacityValue: Double = 0.5 // Opacity (between 0 and 1)
                
                return Color(red: redValue, green: greenValue, blue: blueValue, opacity: opacityValue)
        }
        var customColor5: Color {
            let redValue: Double = 0.50 // Red component (between 0 and 1)
                let greenValue: Double = 0.50 // Green component (between 0 and 1)
            let blueValue: Double = 0.50 // Blue component (between 0 and 1)
                let opacityValue: Double = 0.2 // Opacity (between 0 and 1)
                
                return Color(red: redValue, green: greenValue, blue: blueValue, opacity: opacityValue)
        }
    }
    
    private func addItem() {
                if !newGoal.isEmpty && !newPriority.isEmpty {
                    goalsViewModel.addGoal(newGoal, priority: newPriority)
                    newGoal = ""
                    newPriority = ""
                    print("item added")
        }
    }
        
    private func deleteGoal(at offsets: IndexSet) {
                goalsViewModel.deleteGoal(at: offsets.first ?? 0)
    }
}

#Preview {
    Goals()
}
