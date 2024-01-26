//
//  CircleImage3.swift
//  Daily Schedule
//
//  Created by William James Kimball on 1/8/24.
//

import SwiftUI

struct CircleImage3: View {
    var body: some View {
        Image("FreeEvents")
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
    CircleImage3()
}
