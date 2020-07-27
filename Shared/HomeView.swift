//
//  HomeView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/26/20.
//

import SwiftUI

struct HomeView: View {
    //    @State var appointments: [AppointmentPreview]
    var body: some View {
        VStack(alignment: .center) {
            HeaderView()
            HeaderButtons()
                .padding(.top, 32.0)
            VStack {
                HStack(alignment: .center) {
                    Text("Citas próximas")
                        .font(FontNameManager.title)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button{

                    } label: {
                        Image(systemName: "calendar").foregroundColor(.white)
                    }
                    .padding(.all, 10)
                    .background(Capsule().fill(Color.accentColor))
                }
                HStack(alignment: .center) {
                    Circle().fill(Color("TeleconsultaColor"))
                        .frame(width: 20, height: 20)
                    Text("Teleconsulta").font(FontNameManager.body2).foregroundColor(Color("BlackColor"))
                    Circle().fill(Color("PresencialColor"))
                        .frame(width: 20, height: 20)
                    Text("Presencial").font(FontNameManager.body2).foregroundColor(Color("BlackColor"))
                    Spacer()
                }
            }
            //            LazyVStack {
            //                ForEach(appointments, id: \.id) { preview in
            //                    Text(preview.doctor)
            //                }
            //            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
        .background(ColorSpot().fill(Color("PrimaryColor")).edgesIgnoringSafeArea(.all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


let sampleAppointments: [AppointmentPreview] = [
    AppointmentPreview(id: "1", doctor: "Albuja", specialty: "Pediatría", date: Date(timeIntervalSinceNow: TimeInterval(-20000)))
]

struct HeaderButtons: View {
    var body: some View {
        HStack(alignment: .center, spacing: 32.0) {
            Button {

            } label: {
                HStack {
                    Image("Paper")
                    Text("Recetas")
                    Spacer()
                }.foregroundColor(.white)
            }
            .padding(.vertical, 8.0)
            .padding(.horizontal, 16.0)
            .background(Capsule().fill(Color.accentColor))
            Spacer()
            Button {

            } label: {
                HStack {
                    Image("Pdf")
                    Text("Examenes")
                    Spacer()
                } .foregroundColor(.white)
            }
            .padding(.vertical, 8.0)
            .padding(.horizontal, 16.0)
            .background(Capsule().fill(Color.accentColor))
        }
    }
}
