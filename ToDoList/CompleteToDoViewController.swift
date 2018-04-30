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
    var selectedToDo = ToDo()
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo.name
    }

    @IBAction func completeToDo(_ sender: Any) {
        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
    }

   

}
