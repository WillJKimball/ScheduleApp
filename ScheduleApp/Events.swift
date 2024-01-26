//
//  Events.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//

import SwiftUI

struct EventItem: Identifiable {
    let id = UUID()
    var text: String
    var isStrikedThrough: Bool = false
}

class EventsViewModel: ObservableObject {
    @Published var events: [EventItem] = []
    
    func addEvent(_ event: EventItem) {
        events.append(event)
    }
    
    func deleteEvent(at index: Int) {
        events.remove(at: index)
    }
}

struct Events: View {
    @ObservedObject var eventsViewModel = EventsViewModel()
    @State private var newItem: String = ""
    var body: some View {
        ZStack{
            Color(customColor4)
                .ignoresSafeArea()
            VStack {
                Text("Events")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                CircleImage3()
                
                HStack {
                    DropDownBar()
                        .padding()
                    TextField("Enter event", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Button(action: addItem) {
                    Text("Add Item")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                
                List {
                    ForEach($eventsViewModel.events) { $event in
                                Text(event.text)
                            .listRowBackground(customColor5)
                                .strikethrough(event.isStrikedThrough)
                                    .onTapGesture {
                                    $event.isStrikedThrough.wrappedValue.toggle()
                                }
                            }
                        .onDelete(perform: deleteItem)
                        .listRowSeparatorTint(Color.black)
                }
            }
        }
        var customColor4: Color {
                let redValue: Double = 1.00 // Red component (between 0 and 1)
                let greenValue: Double = 0.41 // Green component (between 0 and 1)
            let blueValue: Double = 0.12 // Blue component (between 0 and 1)
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
            let newEvent = EventItem(text: newItem)
            eventsViewModel.addEvent(newEvent)
            newItem = "" // Reset the input field
            print("item added")
    }

    private func deleteItem(at offsets: IndexSet) {
            eventsViewModel.deleteEvent(at: offsets.first ?? 0)
    }
}

#Preview {
    Events()
}
