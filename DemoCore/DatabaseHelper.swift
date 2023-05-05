//
//  DatabaseHelper.swift
//  DemoCore
//
//  Created by West Agile labs on 01/05/23.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: [String: String]) {
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context!) as! Person
        
        person.name = object["name"]
        person.address = object["address"]
        person.city = object["city"]
        person.mobile = object["mobile"]
        //to save
        do {
            try context?.save()
        } catch {
            print("Error occured")
        }
    }
    
    //to get person data in all 4labels, it is used to fetch the data in all labels
    func getPersonData() -> [Person] {
        var person = [Person]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            person = try context?.fetch(fetchRequest) as! [Person]
        } catch {
            print("cannot get the data")
        }
        return person
    }
    //used for deleting person data after fetching from getPersonData()
    func deleteData(index: Int) -> [Person] {
        var person = getPersonData()
        context?.delete(person[index])
        person.remove(at: index)//used to delete data which are stored in persistent container
        do {
            try context?.save()
        } catch {
            print("cannot find data")
        }
        return person
    }
}
