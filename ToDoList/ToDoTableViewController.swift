//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Ivaylo Yosifov on 18/4/18.
//  Copyright © 2018 Ivaylo Yosifov. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createTodos()

       
    }
    
    func createTodos() -> [ToDo] {
        let eggs = ToDo()
        let dog = ToDo()
        let cheese = ToDo()
        eggs.name = "Buy eggs"
        eggs.important = false
        dog.name = "Walk the dog"
        cheese.name = "Buy Cheese"
        cheese.important = true
        return [eggs, dog, cheese]
    }
    



 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        if !toDo.important  {
            cell.textLabel?.text = toDo.name
        } else {
            cell.textLabel?.text = "❗️" + toDo.name
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
    
    
    
}

