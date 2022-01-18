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
    func createStudent(name: String, age: String) { //Can add other parameters here for second text input
        let newStudent: Student = Student(name: name, age: age, favoriteColor: "Red")
        studentList.append(newStudent)
    }
    
    func deleteStudent(student: Student) {
        guard let index = studentList.firstIndex(where: {$0 == student}) else {return}
        studentList.remove(at: index)
    }
}
