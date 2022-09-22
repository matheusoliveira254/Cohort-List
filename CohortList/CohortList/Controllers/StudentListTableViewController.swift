//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Matheus Oliveira on 9/20/22.
//

import UIKit

class StudentListTableViewController: UITableViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? StudentDetailViewController {
                    let student = StudentController.sharedInstance.students[index.row]
                    destination.studentReceiver = student
                }
            }
        }
    }
}
