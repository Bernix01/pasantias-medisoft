//
//  AllCertificatesView.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 29/9/20.
//

import SwiftUI

struct AllCertificatesView: View {


    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Certificate.entity(), sortDescriptors: [])
    var certificates: FetchedResults<Certificate>

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(certificates, id: \.id){ certificate in
                    CertificateComponent(certificate: certificate)
                }
            }.padding()
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCertificatesView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
