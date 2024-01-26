//
//  CircleImage.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/6/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("FreeGoals")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 6)
        }
        .shadow(radius: 12)
    }
}


#Preview {
    CircleImage()
}

