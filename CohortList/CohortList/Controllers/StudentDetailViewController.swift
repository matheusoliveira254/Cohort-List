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
        
//        textView.delegate = self
//        textView.text = "Student Description"
//        textView.textColor = UIColor.lightGray
    }
    
    @IBAction func saveStudentButtonTapped(_ sender: Any) {
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
    
}
