//
//  HeaderView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/26/20.
//

import SwiftUI

struct HeaderView: View {

    let onMenuBtnClick: () -> Void
    let onProfileBtnClick: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            Button(action: onMenuBtnClick) {
                Image("Drawer")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 27, height: 16)
            }.accentColor(Color("PrimaryColor"))
            Spacer()
            Image("LogoSquare")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 57, height: 57)
            Spacer()
            Button(action: onProfileBtnClick) {
                Image("Avatar")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(color: Color(.gray), radius: 2, x: 0, y: 3)
                    .frame(width: 40, height: 40)
            }.padding(.vertical)

        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(onMenuBtnClick: {}, onProfileBtnClick: {})
    }
}
