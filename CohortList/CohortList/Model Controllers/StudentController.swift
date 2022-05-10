//
//  StudentController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import Foundation

class StudentController {
    // Singleton - ensures our data is always the SAME INSTANCE
    static var sharedInstance = StudentController()
    // Source of Truth
    var students: [Student] = []
    
    //MARK: CRUD Functions
    func createStudent(name: String, cohort: String) {
        let newStudent: Student = Student(name: name, cohort: cohort)
        students.append(newStudent)
    }
    
//    func deleteStudent(student: Student) {
//        guard let index = students.firstIndex(of: student) else {return}
//        students.remove(at: index)
//    }
}
