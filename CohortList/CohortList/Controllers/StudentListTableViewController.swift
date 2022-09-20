//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Matheus Oliveira on 9/20/22.
//

import UIKit

class StudentListTableViewController: UITableViewController {

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentIDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addNewStudentButton(_ sender: Any) {
        createStudent()
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.sharedInstance.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        let students = StudentController.sharedInstance.students[indexPath.row]
        let studentToDisplay = students
        cell.textLabel?.text = studentToDisplay.name
        cell.detailTextLabel?.text = studentToDisplay.cohortID

        return cell
    }
    
    func createStudent() {
        guard let studentNameInput = studentNameTextField.text else {return}
        guard let studentIDInput = studentIDTextField.text else {return}
        
        StudentController.sharedInstance.createStudent(name: studentNameInput, cohortID: studentIDInput)
        tableView.reloadData()
    }
}
