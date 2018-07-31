//
//  ViewController.swift
//  coredata1
//
//  Created by ChandlerZou on 2018/7/16.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Shashikant", forKey: "username")
        newUser.setValue("1234", forKey: "password")
        newUser.setValue("12", forKey: "age")
        do{
            try context.save()
        }catch{
            print("failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "username") as! String)
                var date = Date()
                let dor = DateFormatter()
//                dor.date(from: date)
                print(date)
                let z = TimeZone(identifier: "Asia/Shanghai")
                dor.timeZone = z
                let date1 = dor.defaultDate
                print(date1)
                
            }
        }catch{
            print("faled")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

