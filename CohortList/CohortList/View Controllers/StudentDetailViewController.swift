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
    }
    
    //MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
} // End of class
