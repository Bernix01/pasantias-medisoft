//
//  ProgressBar.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 21/9/20.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .foregroundColor(Color("Grey2Color"))
                Rectangle()
                    .frame(width: min(
                            CGFloat(self.value)*geometry.size.width,
                            geometry.size.width),
                           height: geometry.size.height)
                    .foregroundColor(.accentColor)
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.4))
            .previewLayout(.fixed(width: 300.0, height: 40.0))
    }
}
