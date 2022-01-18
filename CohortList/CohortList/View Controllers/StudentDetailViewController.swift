//
//  StudentDetailViewController.swift
//  CohortList
//
//  Created by Karl Pfister on 1/18/22.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var cohortNumberTextField: UITextField!
    @IBOutlet weak var studentDescriptionTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(with: studentReciever)
    }
    //MARK: - Properties
    var studentReciever: Student? = nil
    
    //MARK: - Helper Methods
    func updateViews(with student: Student?) {
        guard let student = student else { return }
        studentNameTextField.text = student.name
        cohortNumberTextField.text = String(student.cohortNumber)
        studentDescriptionTextView.text = student.studentDescription
    }
    
    func clearData() {
        studentDescriptionTextView.text = ""
        cohortNumberTextField.text = ""
        studentNameTextField.text = ""
    }
    
    //MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearData()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let studentReciever = studentReciever {
            StudentController.sharedInstance.deleteStudent(student: studentReciever)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = studentNameTextField.text, let cohortNum = cohortNumberTextField.text, let studentDescription = studentDescriptionTextView.text, let studentCohortNumber = Int(cohortNum) else {return}
        
        if let studentReciever = studentReciever {
           // has a value. the user wants to update
            StudentController.sharedInstance.updateStudent(student: studentReciever, newName: name, newCohortNum:studentCohortNumber, newDescription: studentDescription)
        } else {
            // does not have value. the user wants to do create
            StudentController.sharedInstance.createStudent(name: name, cohortNumber: studentCohortNumber, studentDescription: studentDescription)
        }
        self.navigationController?.popViewController(animated: true)
    }
} // End of class
