//
//  AppointmentPreview.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI

struct AppointmentPreview: View {
    let appointment: AppointmentInfo
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {}
                    label: {
                        Image("Avatar")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .clipShape(Circle())
                            .shadow(color: Color(.gray), radius: 2, x: 0, y: 3)
                            .frame(width: 30, height: 30)
                    }
                Text(appointment.drName!)
            }
            .padding(.bottom, 8.0)
            Text("Consulta del \(formatDate(appointment.date!, dateStyle: .short, timeStyle: .none))")
            Text(appointment.specialty!)
            Text(appointment.location!)
        }
        .font(FontNameManager.menu2)
        .foregroundColor(Color("BlackColor"))
    }
}


struct AppointmentPreview_Previews: PreviewProvider {


    static var previews: some View {
        let apmt = AppointmentInfo(context: PersistenceController.preview.container.viewContext)

        apmt.id = "4"
        apmt.drName = "Dra. Paula González"
        apmt.date = Date()
        apmt.specialty = "Medicina General"
        apmt.location = "Los Álamos"

        return AppointmentPreview(appointment: apmt)
            .previewLayout(.fixed(width: 400.0, height: 200.0))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
