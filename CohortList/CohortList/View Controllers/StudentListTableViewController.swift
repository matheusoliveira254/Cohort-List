//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import UIKit

class StudentListTableViewController: UITableViewController, UITextFieldDelegate{

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var cohortIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Helper Functions
    func createStudent() {
        guard let name = studentNameTextField.text, let cohortID = cohortIdTextField.text else {return}
        StudentController.sharedInstance.createStudent(name: name, cohort: cohortID)
        studentNameTextField.text = ""
        cohortIdTextField.text = ""
        tableView.reloadData()
    }

    @IBAction func addStudentButtonTapped(_ sender: Any) {
        createStudent()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.sharedInstance.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...

        let students = StudentController.sharedInstance.students
        let studentToDisplay = students[indexPath.row]
      
        cell.textLabel?.text = studentToDisplay.name
        cell.detailTextLabel?.text = studentToDisplay.cohortNumber
        
        return cell
    }
}

