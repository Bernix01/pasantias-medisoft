//
//  MenuDrawer.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 14/9/20.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32.0){
            HStack {
                Image("Avatar")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(color: Color(.gray), radius: 2, x: 0, y: 3)
                    .frame(width: 40, height: 40)
                Text("Emily Larco")
                Spacer()
            }
            .padding(.bottom, 32).padding(.horizontal).padding(.top)

            ScrollView {
                VStack(alignment: .leading){
                    HStack(spacing: 16.0) {
                        Image("Orders")
                        Text("Órdenes de exámenes")
                        Spacer()
                    }.padding(.all)
                    HStack(spacing: 16.0) {
                        Image("Recipes")
                        Text("Mis recetas")
                    }.padding(.all)
                    HStack(spacing: 16.0) {
                        Image("Certificates")
                        Text("Mis certificados")
                    }.padding(.all)
                }
            }
        }

    }
}

struct SideMenu: View {
    let width: CGFloat
    @Binding var isOpen: Bool
    let menuClose: () -> Void

    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.isOpen = false
                    }
                }
            }

        return ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }.gesture(drag)

            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)

                Spacer()
            }
        }
    }
}


struct MenuDrawer_Previews: PreviewProvider {
    static var previews: some View {

        SideMenu(width: 370,
                 isOpen: .constant(false),
                 menuClose: {})
    }
}
