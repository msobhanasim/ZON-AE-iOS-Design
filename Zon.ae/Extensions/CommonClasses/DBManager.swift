//
//  DBManager.swift
//  swiftDemoWizerd
//
//  Created by intersoft-ISP on 25/11/16.
//  Copyright © 2016 intersoft-priya. All rights reserved.
//

import UIKit

class DBManager: NSObject {
    
    class func accessUserDefaultsForKey(keyStr :String)->Any?
    {
        let data : NSData? = UserDefaults.standard.object(forKey: keyStr as String) as? NSData
        
        if data != nil
        {
            var retrivedVal  = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            
            print(retrivedVal!)
            
            if retrivedVal is NSDictionary
            {
                return retrivedVal!
            }
            else if retrivedVal is NSArray
            {
                retrivedVal = retrivedVal as! NSArray
            }
            else if retrivedVal is String
            {
                retrivedVal = retrivedVal as! String
            }
            return retrivedVal
        }
        else
        {
            return nil
        }
    }
    
    class func setValueInUserDefaults(value:Any ,forKey keyStr:String)
    {
        let data :NSData = NSKeyedArchiver.archivedData(withRootObject: value) as NSData
        UserDefaults.standard.set(data, forKey: keyStr as String)
        UserDefaults.standard.synchronize()
    }
    
    //MARK:GetFolderPathOfDocumentDirectory
    
    class func getFolderPathForSource(source :String)->String
    {
        let paths :NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectoryPath :String = paths.object(at: 0) as! String
        let folderPath : String = "\(documentDirectoryPath)" + "\(source)"
        let manager :FileManager = FileManager.default
        if !(manager.fileExists(atPath: folderPath))
        {
            do {
                try  manager.createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch let error as NSError {
                NSLog("Unable to create directory \(error.debugDescription)")
            }
        }
        return folderPath as String
    }
    
    
    //MARK:<Get Image From Document Directory>
    class func getImageFromDocumentDirectory(imageName:String)->String
    {
        let filePath :String = self.getFolderPathForSource(source: "/images").appending(((imageName as String)) as String) as String
        let manager :FileManager = FileManager.default
        
        if (manager.fileExists(atPath: filePath as String))
        {
            return filePath
        }
        return ""
    }
    
    //MARK: <Save Image To Document Directory>
    class func saveImageToDocumentDirectory(img :UIImage ,forImageName imageName:String)
    {
        let filePath :String = self.getFolderPathForSource(source: "/images").appending(((imageName as String)) as String) as String
        let imageData = img.jpegData(compressionQuality: 0.7)
        
        do
        {
            try imageData?.write(to: URL(fileURLWithPath: filePath as String), options: .atomic)
        }
        catch
        {
            print(error)
        }
    }
    
    //Mark:<Remove Image From Document Directory>
    class func removeImageFromDocumentDirectory(imageName :String)
    {
        let filePath :String = self.getFolderPathForSource(source: "/images").appending(((imageName as String)) as String) as String
        let manager :FileManager = FileManager.default
        if (manager.fileExists(atPath: filePath as String))
        {
            do
            {
                try  manager.removeItem(atPath: filePath as String)
            }
            catch
            {
                print(error)
            }
        }
    }
    
    //MARK: RemoveDataFromUserDefaults
    class func cleanUpUserDefaults()
    {
        let defaults :UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: "isLoggedIn")
        defaults.removeObject(forKey: "loginModal")
        defaults.removeObject(forKey: "i_have_count")
        defaults.removeObject(forKey: "arrLoc")
        defaults.removeObject(forKey: "lat")
        defaults.removeObject(forKey: "long")

        
    }
   
    
}


















