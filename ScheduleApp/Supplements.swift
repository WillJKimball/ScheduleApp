//
//  Supplements.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//

import SwiftUI

struct CheckableItem: Identifiable {
    let id = UUID()
    var text: String
    var isChecked: Bool = false
}

class SupplementsViewModel: ObservableObject {
    @Published var supplements: [CheckableItem] = []
    
    func addItem(_ item: CheckableItem) {
        supplements.append(item)
    }
    
    func deleteItem(at index: Int) {
        supplements.remove(at: index)
    }
}

struct Supplements: View {
    @ObservedObject var supplementsViewModel = SupplementsViewModel()
    @State private var newItemText: String = ""   // New state for item input

    var body: some View {
        ZStack{
            Color(customColor3)
                .ignoresSafeArea()
            VStack {
                Text("Supplements")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                CircleImage2()
                // TextField for new item input
                TextField("Enter new item", text: $newItemText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .padding()
                
                // Button to add the new item
                Button(action: addItem) {
                    Text("Add Item")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding()
                
                // Existing list
                List {
                    ForEach(supplementsViewModel.supplements) { item in
                            HStack {
                                Toggle(isOn: $supplementsViewModel.supplements[getIndex(for: item)].isChecked) {
                                    Text(item.text)
                                    .listRowBackground(customColor5)
                                    .strikethrough(item.isChecked, color: .black)
                                    }
                                }
                            }
                        .onDelete(perform: deleteItem)
                        .listRowSeparatorTint(Color.black)
                }
            }
        }
        var customColor3: Color {
            let redValue: Double = 1.00 // Red component (between 0 and 1)
                let greenValue: Double = 0.05 // Green component (between 0 and 1)
                let blueValue: Double = 0.05 // Blue component (between 0 and 1)
                let opacityValue: Double = 0.45 // Opacity (between 0 and 1)
                
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
        let newItem = CheckableItem(text: newItemText)
        supplementsViewModel.addItem(newItem)
        newItemText = "" // Resetting the text field
        print("item added")
    }
    private func deleteItem(at offsets: IndexSet) {
            supplementsViewModel.deleteItem(at: offsets.first ?? 0)
    }
    private func getIndex(for item: CheckableItem) -> Int {
            if let index = supplementsViewModel.supplements.firstIndex(where: { $0.id == item.id }) {
                return index
            }
            return 0
        }
}

#Preview {
    Supplements()
}
