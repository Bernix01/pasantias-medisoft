//
//  PastExamsOrderComponent.swift
//  Medisoft
//
//  Created by Guillermo Bernal on 28/9/20.
//

import SwiftUI

struct PastExamsOrderComponent: View {
    let order: ExamsOrder
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("#\(order.id!)")
                    .font(FontNameManager.menu)
                    .padding(.bottom, 5.0)
                Spacer()
                Text("LABORATORIO")
            }
            DrInfoComponent(drName: order.drName!,
                            specialty: order.specialty!)
            HStack {
                Text("Incluye: ")
                    .font(FontNameManager.body2Bold)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.top, 4.0)
                Text("4 exámenes")
                Spacer()
            }
        }
        .padding(.all)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white))
    }
}

struct PastExam_Previews: PreviewProvider {
    
    static var previews: some View {
        let order = ExamsOrder(context: PersistenceController.preview.container.viewContext)
        
        return PastExamsOrderComponent(order: order)
            .previewLayout(.fixed(width: 300.0, height: 100.0))
            .environment(\.managedObjectContext,
                         PersistenceController
                            .preview
                            .container
                            .viewContext)
    }
}
