//
//  Student.swift
//  CohortList
//
//  Created by Matheus Oliveira on 9/20/22.
//

import Foundation

class Student {
    var name: String
    var cohortID: String
    var studentDescription: String
    
    init(name: String, cohortID: String, studentDescription: String) {
        self.name = name
        self.cohortID = cohortID
        self.studentDescription = studentDescription
    }
}

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name &&
        lhs.cohortID == rhs.cohortID && lhs.studentDescription == rhs.studentDescription
    }
}
