//
//  CircleImage2.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//

import SwiftUI

struct CircleImage2: View {
    var body: some View {
        Image("FreeSupplements2")
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
    CircleImage2()
}
