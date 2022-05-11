//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by Karl Pfister on 5/10/22.
//

import UIKit

class StudentDetailViewController: UIViewController {

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var cohortIDTextField: UITextField!
    @IBOutlet weak var studentDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var student: Student?
    
    func updateViews() {
        guard let student = student else {return}
        studentNameTextField.text = student.name
        cohortIDTextField.text = "\(student.cohortID)"
        studentDescriptionTextView.text = student.description
    }
    func clearData() {
        studentNameTextField.text = ""
        cohortIDTextField.text = ""
        studentDescriptionTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = studentNameTextField.text, let id = cohortIDTextField.text, let description = studentDescriptionTextView.text else {return}
        
        if let student = student {
            // The user wants to update
            StudentController.sharedInstance.update(student: student, with: name, cohort: Int(id) ?? 0, description: description)
        } else {
            // The user wants to create a new student
            StudentController.sharedInstance.createStudent(name: name, cohort: Int(id) ?? 0, description: description)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let student = student else {return}
        StudentController.sharedInstance.deleteStudent(student: student)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearData()
    }
}
