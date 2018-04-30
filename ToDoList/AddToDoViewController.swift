//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Ivaylo Yosifov on 18/4/18.
//  Copyright © 2018 Ivaylo Yosifov. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    
    
    @IBOutlet weak var titleTextField: UITextField!
   
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func addTapped(_ sender: Any) {

        if let titleField = titleTextField.text {
            let toDo = ToDo()
            toDo.name = titleField
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }

        
    }
}
