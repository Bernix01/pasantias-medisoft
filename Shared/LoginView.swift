//
//  ContentView.swift
//  Shared
//
//  Created by Guillermo Bernal on 7/10/20.
//

import SwiftUI

struct LoginView: View {
    @State var userName = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 8.0) {
                Image("Logo")
                Spacer()
                Text("Iniciar sesión")
                    .font(FontNameManager.largeTitle)
                    .foregroundColor(Color("BlackColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Group {
                    TextField("identificación", text: $userName)
                        .font(FontNameManager.body)
                        .padding(.top, 20)
                        .foregroundColor(Color("BlackColor"))
                    Divider()
                        .foregroundColor(Color("BlackColor"))

                    SecureField("contraseña", text: $password)
                        .font(FontNameManager.body)
                        .padding(.top, 20)
                        .foregroundColor(Color("BlackColor"))
                    Divider()
                        .foregroundColor(Color("BlackColor"))
                }

                NavigationLink(destination: HomeView()
                               //                       , tag: 1
                               //                       , selection: $selection
                ) {
                    //            Button {
                    //                self.selection = 1
                    //            } label: {
                    Text(NSLocalizedString("Ingresar", comment: "Login button"))
                        .frame(maxWidth:.infinity)
                    //            }
                    //            .padding(.top, 16.0)
                    //            .padding(.horizontal)
                }
                .buttonStyle(WideButtonStyle(bgColor: Color("PrimaryColor")))
                HStack {
                    Text(NSLocalizedString("¿Has olvidado la contraseña?", comment: ""))
                    Button(action: {}){
                        Text("Click aquí").underline()
                            .foregroundColor(.blue)
                    }
                }.font(.caption)
                .padding(.bottom, 32.0)
                Text("¿Aún no tienes cuenta?")
                    .font(.caption)
                Button{

                } label: {
                    Text(NSLocalizedString("Regístrate aquí", comment: "Register button"))
                        .frame(maxWidth:.infinity)
                }.padding(.horizontal)
                .buttonStyle(WideButtonStyle(bgColor: Color("PrimaryColor")))
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}

struct WideButtonStyle: ButtonStyle {
    var bgColor: Color
    let cornerRadius: CGFloat = 20
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("Montserrat-Medium", size: 20,
                              relativeTo: .headline))
            .padding(.vertical, 10)
            .padding(.horizontal, 32)
            .background(
                Capsule()
                    .fill(Color("PrimaryColor"))
                    .shadow(color: .gray, radius: 2,x: 0, y: 1)
            )
            .foregroundColor(.white)
            .animation(.spring())
    }
}

struct ColorSpot: Shape {
    func path(in rect: CGRect) -> Path{
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: 0, y: 0.16667*height))
        path.addCurve(to: CGPoint(x: 0.4375*width, y: 0.14583*height),control1: CGPoint(x: 0.125*width, y: 0.14583*height),control2: CGPoint(x: 0.1875*width, y: 0.10417*height))
        path.addCurve(to: CGPoint(x: 1*width, y: 0.14583*height),control1: CGPoint(x: 0.625*width, y: 0.16667*height),control2: CGPoint(x: 0.75*width, y: 0.16667*height))
        path.addLine(to: CGPoint(x: 1*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        
        return path
    }
}
