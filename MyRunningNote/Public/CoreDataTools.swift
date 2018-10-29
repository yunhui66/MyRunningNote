//
//  CoreDataTools.swift
//  XiaoTuBoss
//
//  Created by cao longjian on 2018/1/25.
//  Copyright © 2018年 chuangchuang. All rights reserved.
//

import UIKit
import CoreData

public class CoreDataTools {
    
    /**
     * iOS10
     */
    @available(iOS 10.0, *)
    static private var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MyRunningNote")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                //fatalError("Unresolved error \(error), \(error.userInfo)")
                handleError(error: error)
            }
        })
        return container
    }()
    
    /*==========================================================================*/
    /*==========================================================================*/
    /**
     * iOS9
     */
    static private var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        //managedObjectModel
        var modelURL = Bundle.main.url(forResource: "MyRunningNote", withExtension: "momd")!
        //modelURL = modelURL.appendingPathComponent("XiaoTuBoss.mom")
        
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)!
        
        //applicationDocumentsDirectory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let applicationDocumentsDirectory = urls[urls.count-1]
        let url = applicationDocumentsDirectory.appendingPathComponent("MyRunningNote.sqlite")
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            handleError(error: error as NSError)
        }
        
        return coordinator
    }()
    
    static private var managedObjectContext: NSManagedObjectContext = {
        let coordinator = persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    
    /*==========================================================================*/
    /*==========================================================================*/
    
    // MARK: - Core Data Saving support
    static private func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    //fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    handleError(error: nserror)
                }
            }
        } else {
            // Fallback on earlier versions
            if managedObjectContext.hasChanges {
                do {
                    try managedObjectContext.save()
                } catch {
                    let nserror = error as NSError
                    handleError(error: nserror)
                }
            }
        }
        
    }
    
    /*==========================================================================*/
    /*==========================================================================*/
    // MARK: - 错误信息
    static private func handleError (error: NSError) {
        
        let failureReason = "There was an error creating or loading the application's saved data."
        
        // Report any error we got.
        var dict = [String: AnyObject]()
        dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
        dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
        dict[NSUnderlyingErrorKey] = error as NSError
        let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
        NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
        abort()
    }
    
}


// MARK: - 增删改查
extension CoreDataTools {
    
    
    /// 增加
    ///
    /// - Parameters:
    ///   - entyName: 实体名称
    ///   - dict: 数据
    static func insertData(entyName: String, dict: [String : Any?]) {
        
        let context = getContext()
        if #available(iOS 10.0, *) {
            //线程问题仅在iOS10 处理，其他可根据需求
            self.persistentContainer.performBackgroundTask({ (context) in

                let entity  = NSEntityDescription.entity(forEntityName: entyName, in: context)
                let newObj = NSManagedObject(entity: entity!, insertInto: context)

                for (key, value) in dict {
                    if ((value as? NSNull) != nil) {
                        newObj.setValue(nil, forKey: key)
                    } else {
                        newObj.setValue(value, forKey: key)
                    }
                }
                //context.performAndWait({
                    do {
                        try context.save()
                        print("保存成功！")
                    } catch {
                        let nserror = error as NSError
                        handleError(error: nserror)
                        fatalError("不能保存：\(error)")
                    }
                //})
            })
        } else {
            let entity  = NSEntityDescription.entity(forEntityName: entyName, in: context)
            let newObj = NSManagedObject(entity: entity!, insertInto: context)
            
            for (key, value) in dict {
                if ((value as? NSNull) != nil) {
                    newObj.setValue(nil, forKey: key)
                } else {
                    newObj.setValue(value, forKey: key)
                }
            }
            context.performAndWait({
                //context.insert(newObj)
                self.saveContext()
                
            })
            
        }
    
    }
    
    
    /// 删除
    ///
    /// - Parameters:
    ///   - entyName: 实体名称
    ///   - predStr: 查询条件 例 "name='value'"
    static func removeData(entyName: String, predStr: String?) {
        
        let context = getContext()
        
        let request = getRequest(entyName: entyName, predicateStr: predStr)
        
        let objArr = contextFetchRequest(context: context, request: request)
        
        if let objArr = objArr {
            for obj in objArr{
                context.delete(obj)
            }
        }
        self.saveContext()
    }
    
    /// 修改
    ///
    /// - Parameters:
    ///   - entyName: 实体名称
    ///   - predStr: 查询条件  例 "name='value'"
    static func modifyData(entyName: String, predStr: String?, dict: [String : Any?]) {
        let context = getContext()
        
        let request = getRequest(entyName: entyName, predicateStr: predStr)
        
        let objArr = contextFetchRequest(context: context, request: request)
        
        if let objArr = objArr {
            for obj in objArr{
                for (key, value) in dict {
                    obj.setValue(value, forKey: key);
                }
            }
        }
        self.saveContext()
    }
    
    /// 查询
    ///
    /// - Parameters:
    ///   - entyName: 实体名称
    ///   - predStr: 查询条件 例 "name='value'"
    /// - Returns: [NSManagedObject]
    static func queryData(entyName: String, predStr: String?) -> [NSManagedObject]? {
        
        let context = getContext()
        
        let request = getRequest(entyName: entyName, predicateStr: predStr)
        
        let objArr = contextFetchRequest(context: context, request: request)
        
        return objArr
    }
    
    
    /// 查询最后一个实体的某个属性值
    ///
    /// - Parameters:
    ///   - entyName: 实体名称
    ///   - predStr: 查询条件 例 "name='value'"
    /// - Returns: 最后一个实体的 keyName 值
    static func queryDataForLastObjWithName(entyName: String, key: String, predStr: String? = nil) -> Any? {
        
        let context = getContext()
        
        
        let request = getRequest(entyName: entyName, predicateStr: predStr)
        
        let objArr = contextFetchRequest(context: context, request: request)
        
        if let obj = objArr?.last {
            return obj.value(forKey: key)
        }

        return nil
    }
    
    
    // MARK: - Private
    //获得 context
    static private func getContext() -> NSManagedObjectContext {
        var context: NSManagedObjectContext!
        if #available(iOS 10.0, *) {
            
            context = self.persistentContainer.viewContext
        } else {
            context = self.managedObjectContext
        }
        return context
    }
    
    //获得 request
    static private func getRequest(entyName: String, predicateStr: String?) -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entyName)
        if let predicateStr = predicateStr {
            request.predicate = NSPredicate(format: predicateStr)
        }
        //NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        return request
    }
    
    //context 根据 request 获取 NSManagedObject 数组
    static private func contextFetchRequest(context: NSManagedObjectContext, request: NSFetchRequest<NSFetchRequestResult>) -> [NSManagedObject]? {
        var objArr: [NSManagedObject]?
        do {
            objArr = try context.fetch(request) as? [NSManagedObject]
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return objArr
    }
    
}
