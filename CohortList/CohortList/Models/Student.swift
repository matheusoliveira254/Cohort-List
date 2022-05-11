//
//  Student.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import Foundation

class Student {
    
    var name: String
    var cohortID: Int
    var description: String
    
    
    init(name: String, cohort: Int, description: String) {
        self.name = name
        self.cohortID = cohort
        self.description = description
    }
}// End of class

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name &&
        lhs.cohortID == rhs.cohortID &&
        lhs.description == rhs.description
    }
}

