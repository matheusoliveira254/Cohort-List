//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import UIKit

class StudentListTableViewController: UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // Helper Functions
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.sharedInstance.students.count
    }
    
    //MARK: - delete
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        // Configure the cell...
        
        let students = StudentController.sharedInstance.students
        let studentToDisplay = students[indexPath.row]
        
        cell.textLabel?.text = studentToDisplay.name
        cell.detailTextLabel?.text = "\(studentToDisplay.cohortID)"
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // MARK: - IIDOO
        /// Identifier - We are checking to see if the identifier of our segue matches "toDetailVC". If it does then we will run the code inside, if not then we will just pass over it.
        if segue.identifier == "toDetailVC" {
            /// Index - Discovering what row the user has seleceted
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the *ViewController* we want. This also allows us to access the properties on that *ViewController*
                if let destination = segue.destination as? StudentDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *Student* that matches in our *students* array.
                    let student = StudentController.sharedInstance.students[index.row]
                    /// Object to receive - Sets the value of the optional *student* on the *destination* to the *student* we just retrived.
                    destination.student = student
                }
            }
        }
    }
}

