//
//  CertificateComponent.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 29/9/20.
//

import SwiftUI

struct CertificateComponent: View {
    let certificate: Certificate

    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4.0){
                Text("#\(certificate.wrappedID)")
                    .font(FontNameManager.menu)
                    .foregroundColor(Color("BlackColor"))
                Text("\(certificate.wrappedDrName)")
                    .font(FontNameManager.title3)
                    .foregroundColor(Color("BlackColor"))
                Text("\(certificate.wrappedDate, formatter: dateFormatter)")
                    .font(FontNameManager.menuBold)
                    .foregroundColor(Color("GreyColor"))
            }
            Spacer()
            Button {}
                label: {
                    Image("Pdf")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color("BlackColor"))
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 30, height: 30)
                }.padding(.vertical)
        }.padding()
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color("ShadowColor"), radius: 3, x: 0, y: 1))
    }

    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
    }
}


struct CertificateComponent_Previews: PreviewProvider {
    static var previews: some View {
        let certificate = Certificate(context: PersistenceController.preview.container.viewContext)
        certificate.id = "0-007"
        certificate.date = Date()
        certificate.drName = "Dra. Paula González"
        certificate.pdfURL = "https://www.google.com"
        
        return CertificateComponent(certificate: certificate)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
