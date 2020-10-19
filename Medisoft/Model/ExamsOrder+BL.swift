//
//  ExamsOrder+BL.swift
//  Medisoft
//
//  Created by Guillermo Bernal Moreira on 10/6/20.
//

import Foundation

extension ExamsOrder {
    public var wrappedID: String {
        id ?? ""
    }
    
    public var examsArray: [Exam]  {
        let set = exams as? Set<Exam> ?? []

        return set.sorted {
            $0.name! < $1.name!
        }
    }
    
    var examsTaken: Int {
        examsArray.reduce(0) { (sum, exam) -> Int in
            if exam.takenOn != nil {
                return sum + 1
            }
            return sum
        }
    }
}
