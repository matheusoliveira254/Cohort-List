//
//  Student.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import Foundation

class Student: Equatable{
    
    var name: String
    var cohortNumber: Int
    var studentDescription: String
    
    init(name: String, cohortNumber: Int, studentDescription: String) {
        self.name = name
        self.cohortNumber = cohortNumber
        self.studentDescription = studentDescription
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return (lhs.name == rhs.name && lhs.studentDescription == rhs.studentDescription && lhs.cohortNumber == rhs.cohortNumber)
    }
}

