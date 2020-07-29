//
//  HomeView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/26/20.
//

import SwiftUI
import OSLog

struct HomeView: View {
    @State var appointments: [AppointmentPreview] = sampleAppointments
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
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                    }
                    .padding(.all, 10)
                    .background(Capsule().fill(Color.accentColor))
                }
                HStack(alignment: .center) {
                    Circle()
                        .fill(Color("TeleconsultaColor"))
                        .frame(width: 20, height: 20)
                    Text("Teleconsulta")
                        .font(FontNameManager.body2)
                        .foregroundColor(Color("BlackColor"))
                    Circle()
                        .fill(Color("PresencialColor"))
                        .frame(width: 20, height: 20)
                    Text("Presencial")
                        .font(FontNameManager.body2)
                        .foregroundColor(Color("BlackColor"))
                    Spacer()
                }
            }
            LazyVStack {
                ForEach(convertDates(arr: appointments), id: \.date) { day in
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Hoy")
                        ForEach (day.previews, id: \.id) { preview in
                            HStack(alignment: .center) {
                                Text("09h30")
                                Rectangle().fill(Color("TeleconsultaColor"))
                                    .frame(maxWidth: 8, minHeight: 0, maxHeight: .infinity, alignment: .center)
                                VStack(alignment: .leading) {
                                    Text("\(preview.doctor)")
                                    Text("\(preview.specialty)")
                                }
                                Spacer()
                            }
                            .padding(.vertical)

                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.white))
                            .shadow(color: Color("ShadowColor"), radius: 3, x: 0, y: 1)
                    )
                }
            }
            .padding(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
        .background(ColorSpot().fill(Color("PrimaryColor")).edgesIgnoringSafeArea(.all))

    }

    func convertDates(arr: [AppointmentPreview]) -> [AppointmentsPreviewByDate] {
        print(arr)
        let groupDic = Dictionary(grouping: arr) { (preview) -> DateComponents in
            print("F")
            print(preview)
            let date = Calendar.current.dateComponents([.day, .year, .month], from: preview.date)
            print(date)
            return date
        }
        print("foo")
        print(groupDic)
        let data = groupDic.keys.map { dateComponents -> AppointmentsPreviewByDate in
                print("BAR")
             return AppointmentsPreviewByDate(date: dateComponents.date, previews: groupDic[dateComponents])
        }
        return data
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(appointments: sampleAppointments)
    }
}


let sampleAppointments: [AppointmentPreview] = [
    AppointmentPreview(id: "1",
                       doctor: "Dr. Albuja",
                       specialty: "Pediatría",
                       date: Date(timeIntervalSince1970: 1594650600000)),
    AppointmentPreview(id: "2",
                       doctor: "Dr. Albuja",
                       specialty: "Medicina General",
                       date:  Date(timeIntervalSince1970: 1594650600000)),
//    AppointmentPreview(id: "3",
//                       doctor: "Dr. Albuja",
//                       specialty: "Oftalmología",
//                       date: Date(timeIntervalSince1970: 1594564200000))
]

struct HeaderButtons: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
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
