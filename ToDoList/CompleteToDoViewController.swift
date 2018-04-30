//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Ivaylo Yosifov on 30/4/18.
//  Copyright © 2018 Ivaylo Yosifov. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?
    
   
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = selectedToDo?.name
    }

    
    @IBAction func completeTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
        
/*
        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo?.name {
                previousVC.toDos.remove(at: index)
            }
            index += 1
        }
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
 */
    }
    
}
