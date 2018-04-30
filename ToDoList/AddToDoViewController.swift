//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Ivaylo Yosifov on 30/4/18.
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
/*        if let titleField = titleTextField.text {
            let toDo = ToDo()
            toDo.name = titleField
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
        
 */
    
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            if let titleField = titleTextField.text {
                toDo.name = titleField
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
}
