//
//  NoteTableViewController.swift
//  QuizIphone
//
//  Created by Dora The Explorer on 25/10/17.
//  Copyright © 2017 Naufel. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    var tasks : [Task] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! YouTableViewCell
        
        let dataTask = tasks[indexPath.row]
        if let myDataTask = dataTask.name_task {
            cell.labelTask.text = myDataTask
        }
        if let myDataTask1 = dataTask.day_task {
            cell.labelDay.text = myDataTask1
        }
        if let myDataTask2 = dataTask.des_task {
            cell.labelDes.text = myDataTask2
        }
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    func getData() {
        do{
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){if editingStyle == .delete {
        let task = tasks[indexPath.row]
        context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        do{
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("Fetching Failed")
        }
        }
        tableView.reloadData()
    }
    
}
