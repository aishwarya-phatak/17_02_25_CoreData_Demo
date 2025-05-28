//
//  ViewController.swift
//  17_02_25_CoreData_Demo
//
//  Created by Vishal Jagtap on 28/05/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //      insertStudentRecords()
//        retriveStudentRecords()
        deleteStudentRecords()
//        retriveStudentRecords()
    }
    
    func insertStudentRecords(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Student",
                                                           in: managedContext)!
        
        let nsManagedObject = NSManagedObject(entity: entityDescription,
                                              insertInto: managedContext)
        
        nsManagedObject.setValue("Pooja", forKey: "name")
        nsManagedObject.setValue("Karad", forKey: "city")
        
        let nsManagedObject1 = NSManagedObject(entity: entityDescription,
                                               insertInto: managedContext)
        
        nsManagedObject1.setValue("Sakshi", forKey: "name")
        nsManagedObject1.setValue("Karad", forKey: "city")
        
        let nsManagedObject2 = NSManagedObject(entity: entityDescription,
                                               insertInto: managedContext)
        
        nsManagedObject2.setValue("Suhaan", forKey: "name")
        nsManagedObject2.setValue("Sangli", forKey: "city")
        
        do{
            try managedContext.save()
        }catch(let exception1){
            print("\(exception1)")
        }
    }
    
    func retriveStudentRecords(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        let results = try! managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        for eachObject in results{
            let name = eachObject.value(forKey: "name") as! String
            let city = eachObject.value(forKey: "city") as! String
            
            print("name " + name + " " + "city " +  city)
            
            
            try! managedContext.save()
        }
    }
        
        func deleteStudentRecords(){
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
            
            let predicate1 = NSPredicate(format: "name = %@", "Sakshi")
            
            fetchRequest.predicate = predicate1
            
            let results = try! managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for i in 0...results.count - 1{
                managedContext.delete(results[0])
            }
            
            do{
                try managedContext.save()
            } catch(let exception1){
                print("error catched \(exception1)")
            }
        }
    }

