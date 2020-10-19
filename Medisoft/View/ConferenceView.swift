//
//  ConferenceView.swift
//  Medisoft
//
//  Created by Guillermo Bernal Moreira on 10/6/20.
//

import SwiftUI

struct ConferenceView: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var shouldEnd: Bool = false
    
    var body: some View {
        JitsiMeetComponent(room: "FatCupsTellWeirdly",shouldEnd: $shouldEnd ) {
            presentation.wrappedValue.dismiss()
        }
        .navigationTitle("Consulta #123")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: UIColor(named: "PrimaryColor") ?? UIColor.black, tintColor: .white)
    }
}

struct ConferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceView()
    }
}
