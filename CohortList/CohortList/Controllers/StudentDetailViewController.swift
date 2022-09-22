//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by Matheus Oliveira on 9/21/22.
//

import UIKit

class StudentDetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var cohortNumberTextField: UITextField!
    @IBOutlet weak var studentDescriptionTextView: UITextView!
    
    var studentReceiver: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        studentDescriptionTextView.delegate = self
        studentDescriptionTextView.text = "Student Description"
        studentDescriptionTextView.textColor = UIColor.lightGray
        
        displayStudent(student: studentReceiver)
    }
    
    @IBAction func saveStudentButtonTapped(_ sender: Any) {
        saveButtonTapped()
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearData()
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        deleteButton()
    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.textColor == UIColor.lightGray {
//            textView.text = nil
//            textView.textColor = UIColor.black
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "Student Description"
//            textView.textColor = UIColor.lightGray
//        }
//    }
    
    func displayStudent(student: Student?) {
        guard let student = studentReceiver else {return}
        
        studentNameTextField.text = student.name
        cohortNumberTextField.text = student.cohortID
        studentDescriptionTextView.text = student.studentDescription
    }
    
    func clearData() {
        studentNameTextField.text = ""
        cohortNumberTextField.text = ""
        studentDescriptionTextView.text = ""
    }
    
    func deleteButton() {
        guard let studentReceiver = studentReceiver else {return}
        StudentController.sharedInstance.deleteStudent(student: studentReceiver)
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveButtonTapped() {
        guard let name = studentNameTextField.text, let id = cohortNumberTextField.text, let description = studentDescriptionTextView.text else {return}
        
        if let studentReceiver = studentReceiver {
            StudentController.sharedInstance.updateStudent(student: studentReceiver, newName: name, newCohort: id, newDescription: description)
        } else {
            StudentController.sharedInstance.createStudent(name: name, cohortID: id, studentDescription: description)
        }
        navigationController?.popViewController(animated: true)
    }
}
