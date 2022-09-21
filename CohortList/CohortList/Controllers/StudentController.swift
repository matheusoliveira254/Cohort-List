//
//  StudentController.swift
//  CohortList
//
//  Created by Matheus Oliveira on 9/20/22.
//

import Foundation

class StudentController {
    static let sharedInstance = StudentController()
    // Singletons are ways we ensure everytime we refer to data we are refering to the exact same instance of it, every single time. And we want to use that to make sure we access the same one, and not because we need a way to access that.
    
    var students: [Student] = []
    
    //MARK: - CRUD
    
    func createStudent(name: String, cohortID: String, studentDescription: String) {
        let newStudent = Student(name: name, cohortID: cohortID, studentDescription: studentDescription)
        
        students.append(newStudent)
    }
    
    func updateStudent(student: Student, newName: String, newCohort: String, newDescription: String) {
        student.name = newName
        student.cohortID = newCohort
        student.studentDescription = newDescription
    }
    
    func deleteStudent(student: Student) {
        guard let index = students.firstIndex(of: student) else {return}
        students.remove(at: index)
    }
}
