//
//  StudentListTableViewController.swift
//  CohortList
//
//  Created by Stateful Academy on 1/17/22.
//

import UIKit

class StudentListTableViewController: UITableViewController, UITextFieldDelegate{

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentAgeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        studentNameTextField.delegate = self
        studentAgeTextField.delegate = self
    }

    // MARK: - Table view data source

    
    func createStudent() {
        guard let name = studentNameTextField.text else {return}
        guard let age = studentAgeTextField.text else {return}
        
//        var finalAge = 0
//        //let student = Student(name: name, age: 32, favoriteColor: "Red")
//
//        let alert = UIAlertController(title: "Enter \(name)'s age:", message: "Age:", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.text = ""
//        }
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            let textField = alert?.textFields![0]
//            guard let age = Int(textField?.text ?? "0") else {return}
//            finalAge = age
//        }))
//
//        self.present(alert, animated: true, completion: nil)
        
        StudentController.sharedInstance.createStudent(name: name, age: age)
        studentNameTextField.text = ""
        studentAgeTextField.text = ""
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        createStudent()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        studentNameTextField.resignFirstResponder()
        studentAgeTextField.resignFirstResponder()
        createStudent()
        return true
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.sharedInstance.studentList.count // 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        // Configure the cell...

        let studentList = StudentController.sharedInstance.studentList
        let studentForIndexPath = studentList[indexPath.row] // 0 // 1
        // studentList[0]
        // studentList[1]
        // ["Arian","Karl","Adam","Brody", "Trevor"]
        // run:1 (s0,r0) - Student.name == "Arian"
        // run:2 (s0,r1) - student.name == "Karl"
        // run:3 (s0,r2) - student.name == "Adam"
        // run:4 (s0,r3)
        // run:5 (s0,r4)
  
        cell.textLabel?.text = studentForIndexPath.name
        cell.textLabel?.text?.append(": \(studentList[indexPath.row].age)")
    
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let student = Student(name: StudentController.sharedInstance.studentList[indexPath.row].name,
                                  age: StudentController.sharedInstance.studentList[indexPath.row].age,
                                  favoriteColor: StudentController.sharedInstance.studentList[indexPath.row].favoriteColor)
            
            StudentController.sharedInstance.deleteStudent(student: student)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

