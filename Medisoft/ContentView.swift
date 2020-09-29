//
//  ContentView.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        LoginView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
