//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import UIKit

class StudentListTableViewController: UITableViewController, UITextFieldDelegate{

    @IBOutlet weak var studentNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addStudentButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.sharedInstance.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...

        let studentList = StudentController.sharedInstance.students
        let studentForIndexPath = studentList[indexPath.row]
      
        cell.textLabel?.text = studentForIndexPath.name
        cell.textLabel?.text?.append(": \(studentList[indexPath.row].age)")
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
    }
}

