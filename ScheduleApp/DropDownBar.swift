//
//  DropDownBar.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//
import SwiftUI

let options = ["Other", "Family", "Educational", "Financial", "Health", "Relationship", "Career"]


import SwiftUI

struct DropDownBar: View {
    @State private var selectedOption: String = options[0]

    var body: some View {
        VStack {
            Picker("Goals", selection: $selectedOption) {
                ForEach(options, id: \.self) {
                    Text($0)
                        .foregroundColor(.white)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            imageForOption(selectedOption)
        }
    }
    
    @ViewBuilder
    private func imageForOption(_ option: String) -> some View {
        switch option {
        case "Other":
            Image("Goals 1")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Family":
            Image("Family")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Educational":
            Image("Education")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Financial":
            Image("Finance")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Health":
            Image("Health")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Career":
            Image("Career")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        case "Relationship":
            Image("Relationship")
                .resizable()
                .scaledToFit()
                .border(Color.white, width: 4)
        default:
            EmptyView()
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    DropDownBar()
}
