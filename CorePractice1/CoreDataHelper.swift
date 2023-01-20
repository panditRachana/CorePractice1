//
//  CoreDataHelper.swift
//  CorePractice1
//
//  Created by Rachana Pandit on 21/12/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper{
    
let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK: Insert data
func insertData(id:Int16,firstName:String,lastName:String)
{
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "EmployeeData", in: managedContext)
    
    let employee = NSManagedObject(entity: entity!, insertInto: managedContext)
    
    employee.setValue(id, forKey: "empId")
    employee.setValue(firstName, forKey: "empFirstName")
    employee.setValue(lastName, forKey: "empLastname")
    
    do{
        try managedContext.save()
        print("Record added successfully")
    }
    catch let errorMsg as NSError{
        print("Data not inserted\(errorMsg)")
    }
 }

    func retriveData()
    {
        let managedContext = appDelegate.persistentContainer.viewContext
       
        let fetchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "EmployeeData")
        do{
            let results = try managedContext.fetch(fetchResult)
            print(results)
            
            for eachresults in results as! [NSManagedObject]
            {
                print(eachresults.value(forKey: "empId")!)
                print(eachresults.value(forKey: "empFirstName")!)
                print(eachresults.value(forKey: "empLastname")!)
            }
            
        }
        catch let errorMsg as NSError{
            print("Cannot fetch data \(errorMsg)")
        }
    }
    
}
