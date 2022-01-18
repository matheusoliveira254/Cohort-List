//
//  Student.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import Foundation

class Student: Equatable{
    
    var name: String
    var age: String
    var favoriteColor: String
    
    init(name: String, age: String, favoriteColor: String) {
        self.name = name
        self.age = age
        self.favoriteColor = favoriteColor
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return (lhs.name == rhs.name && lhs.favoriteColor == rhs.favoriteColor && lhs.age == rhs.age)
    }
}

