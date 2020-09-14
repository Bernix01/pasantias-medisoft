//
//  HomeView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/13/20.
//

import SwiftUI

struct _HomeView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            HeaderView(onMenuBtnClick: {}, onProfileBtnClick: {})
            Text(NSLocalizedString("Bienvenido(a)", comment: "welcome text"))
                .multilineTextAlignment(.center)
                .padding(.top, 32.0)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20){
                    ForEach((1...100), id: \.self) { number in
                        ImageCardView(number: number)
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
        .background(ColorSpot().fill(Color("PrimaryColor")).edgesIgnoringSafeArea(.all))
    }
}

struct _HomeView_Previews: PreviewProvider {
    static var previews: some View {
        _HomeView()
    }
}

extension View {
    func badge(count: Int = 0) -> some View {
        ZStack(alignment: .topTrailing) {
            self
            ZStack {
                if count != 0 {
                    Text("\(count)")
                        .font(.footnote)
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.red))
                        .animation(nil)
                        .transition(.scale)
                }
            }
            .offset(x: 12, y: -12)
        }
    }
}

struct ImageCardView: View {
    let number: Int
    var body: some View {
        VStack {
            Image("Logo")
            Text("Recetas")
        }
        .padding(.bottom,8)
        .badge(count: number)
        .background(
            RoundedRectangle(cornerRadius: 4).fill(Color(.white)).shadow(radius: 3)
        )
    }
}
