//
//  AddTaskViewController.swift
//  QuizIphone
//
//  Created by Dora The Explorer on 25/10/17.
//  Copyright © 2017 Naufel. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var etDescription: UITextField!
    @IBOutlet weak var etDay: UITextField!
    @IBOutlet weak var etNameTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSaveTask(_ sender: Any) {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let nameTask = Task(context: context)
        nameTask.name_task = etNameTask.text
        nameTask.day_task = etDay.text
        nameTask.des_task = etDescription.text
    
        if etNameTask.text == "" {
            
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etDay.text == "" {
            
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
           
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etDescription.text == "" {
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _ = navigationController?.popViewController(animated: true)
            
            print("Data berhasil disimpan")
        }
    }
    
}

