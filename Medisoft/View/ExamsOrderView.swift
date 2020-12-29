//
//  RecipeView.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 21/9/20.
//

import SwiftUI

struct ExamsOrderView: View {

    var order: ExamsOrder

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text("#\(order.wrappedID)")
                        .font(FontNameManager.largeTitle2)
                    Spacer()
                    Button {}
                        label: {
                            Image("Pdf")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(Color("BlackColor"))
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                }
//                AppointmentPreview(appointment: order.appointment!)

                HStack {
                    Text("Examenes")
                    Spacer()
                    Text("\(order.examsTaken)/\(order.examsArray.count) Realizados")
                }
                .padding(.top)
                .font(FontNameManager.title21)
                .foregroundColor(Color("BlackColor"))
//                ForEach(recipe.medicineArray, id: \.wrappedID) { (medicine: Medicine) in
//                    MedicineComponent(medicine: medicine)
//                }
            }
            .padding([.top, .leading, .trailing])
            .padding(.bottom, 32)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white).shadow(color: Color("ShadowColor"), radius: 3, x: 0, y: 1))
            .padding(.all)
            .navigationBarColor(backgroundColor: UIColor(named: "PrimaryColor") ?? UIColor.black, tintColor: .white)
        }

    }

}

struct ExamsOrderView_Previews: PreviewProvider {

    static var previews: some View {

        let order: ExamsOrder = ExamsOrder(context: PersistenceController.preview.container.viewContext)
        
        order.drName = "Dr. Guillermo Bernal"
        order.id = "1233"
        order.pdfURL = "https://google.com"
        order.preExamIndications = "Test"
        order.specialty = "Rayos Gamma"
        
        
        let exam = Exam(context: PersistenceController.preview.container.viewContext)
        exam.family = "Cardiología"
        exam.id = "4566"
        exam.name = "Rayos Gamma de tórax"
        
        order.exams = [exam]

        return
            NavigationView{
                ExamsOrderView(order: order)
            }.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

