//
//  HeaderView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/26/20.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("Logo").resizable()
                .frame(width: 64, height: 64)
            Spacer()
            Text("Emily")
                .font(.title)
                .foregroundColor(.white)
            Image("Logo").resizable()
                .clipShape(Circle())
                .shadow(color: Color(.gray), radius: 2, x: 0, y: 3)
                .frame(width: 64, height: 64)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
