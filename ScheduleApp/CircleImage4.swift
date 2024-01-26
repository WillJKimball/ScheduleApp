//
//  CircleImage4.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/9/24.
//

import SwiftUI

struct CircleImage4: View {
    var body: some View {
        Image("FreeProductivity")
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
    CircleImage4()
}
