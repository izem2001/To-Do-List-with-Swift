//
//  TaskViewController.swift
//  ToDoListApp
//
//  Created by İzem Özer on 2.08.2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self , action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        guard let taskToDelete = task else { return
            
        }
        
        if var tasks = UserDefaults.standard.stringArray(forKey: "tasks") {
                   // Silinecek görevin indeksini bul
                   if let index = tasks.firstIndex(of: taskToDelete) {
                       // Görevi diziden kaldır
                       tasks.remove(at: index)
                       // UserDefaults'ı güncelle
                       UserDefaults.standard.set(tasks, forKey: "tasks")
        }
    }
    
  }
}
