//
//  DrInfoComponent.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 1/10/20.
//

import SwiftUI

struct DrInfoComponent: View {
    let drName: String
    let specialty: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(drName)
                .font(FontNameManager.largeTitle2)
                .foregroundColor(Color("BlackColor"))
            Text(specialty)
                .font(FontNameManager.title4)
                .foregroundColor(Color("GreyColor"))
        }
    }
}

struct DrInfoComponent_Previews: PreviewProvider {
    static var previews: some View {
        DrInfoComponent(drName: "Guillermo Bernal", specialty: "Medicina General")
            .previewLayout(.fixed(width: 300.0, height: 100.0))
    }
}
