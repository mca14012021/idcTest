//
//  CoreData+Operation.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation
import CoreData
import UIKit
class CoreDataStore {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    static let shared = CoreDataStore()
    var context:NSManagedObjectContext! =  NSManagedObjectContext(concurrencyType:.privateQueueConcurrencyType)
    
    private init() {
        context = delegate.persistentContainer.viewContext
    }
    
    func storeUserData(userName:String,password:String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"UserData")
        do {
            request.predicate = NSPredicate(format:"userName == %@",userName)
            let check = try context.fetch(request)
            if (check.count > 0) {
                for data in check as! [NSManagedObject] {
                    data.setValue(userName, forKey: "userName")
                    data.setValue(password, forKey: "password")
                }
            }else {
                let entity = NSEntityDescription.entity(forEntityName:"UserData", in: context)
                let newEntery = NSManagedObject(entity: entity!, insertInto: context)
                newEntery.setValue(userName, forKey: "userName")
                newEntery.setValue(password, forKey: "password")
            }
        } catch  {
            
        }
        saveData()
    }
    
    func getUserData()-> (userName:String,password:String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"UserData")
        var uName = ""
        var pWord = ""
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                uName = (data.value(forKey: "userName") as! String)
                pWord = (data.value(forKey: "password") as! String)
            }
        } catch {
            
        }
        return (uName,pWord)
    }

    //MARK:- Save Core Data
    func saveData(){
        do {
            try context.save()
        } catch {
            
        }
    }
}
