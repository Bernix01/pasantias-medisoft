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
                Text("\(order.type ?? "")")
            }
            DrInfoComponent(drName: order.drName!,
                            specialty: order.specialty!)
            HStack {
                Text("Incluye: ")
                    .font(FontNameManager.body2Bold)
                    .foregroundColor(Color("GreyColor"))
                    .padding(.top, 4.0)
                Text("\(order.exams?.count ?? 0) exámen(es)")
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
        let examsOrder = ExamsOrder(context: PersistenceController.preview.container.viewContext)
        examsOrder.drName = "Guillermo Bernal"
        examsOrder.id = "123"
        examsOrder.pdfURL = "https://www.google.com"
        examsOrder.preExamIndications = "Ir en ayunas."
        examsOrder.specialty = "Cardiología"
        examsOrder.type = "Imagen"
        
        let exam = Exam(context: PersistenceController.preview.container.viewContext)
        exam.family = "Cardiología"
        exam.id = "456"
        exam.name = "Rayos Gamma de tórax"
        
        examsOrder.exams = [exam]
        
        return PastExamsOrderComponent(order: examsOrder)
            .previewLayout(.fixed(width: 300.0, height: 100.0))
            .environment(\.managedObjectContext,
                         PersistenceController
                            .preview
                            .container
                            .viewContext)
    }
}
