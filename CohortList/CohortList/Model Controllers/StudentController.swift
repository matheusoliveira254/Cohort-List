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
    var studentList: [Student] = []
    
    //MARK: CRUD Functions
    func createStudent(name: String, cohortNumber: Int, studentDescription: String) { //Can add other parameters here for second text input
        let newStudent: Student = Student(name: name, cohortNumber: cohortNumber, studentDescription: studentDescription)
        studentList.append(newStudent)
    }
    
    func deleteStudent(student: Student) {
        guard let index = studentList.firstIndex(where: {$0 == student}) else {return}
        studentList.remove(at: index)
    }
    
    func updateStudent(student: Student, newName: String, newCohortNum: Int, newDescription: String) {
        student.name = newName
        student.cohortNumber = newCohortNum
        student.studentDescription = newDescription
    }
}
