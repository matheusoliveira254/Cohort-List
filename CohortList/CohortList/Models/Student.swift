//
//  Student.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import Foundation

class Student {
    
    var name: String
    var cohortNumber: String
    
    
    init(name: String, cohort: String) {
        self.name = name
        self.cohortNumber = cohort
    }
}// End of class

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name &&
        lhs.cohortNumber == rhs.cohortNumber
    }
}

