//
//  CroppedImageData.swift
//  ZON
//
//  Created by Apple PC on 14/07/2020.
// 
//

import Foundation
import UIKit

struct CroppedImageData : Codable{
    
    var image : String?
    var name : String?
    var isSelected : Bool?
    var quatity : String?
    var catID : String?
    var catName : String?
    var arrayImages : [ImagesArrayData]?
    var image2 : UIImage?
    var notes : String?
    
    public enum CodingKeys: String, CodingKey {
        case image
        case name
        case isSelected
        case quatity
        case catID
        case catName
        case arrayImages
        case image2
        case notes
    }
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> CroppedImageData{
        var obj = CroppedImageData()
        obj.image = json[CodingKeys.image.rawValue] as? String
        obj.name = json[CodingKeys.name.rawValue] as? String
        obj.isSelected = json[CodingKeys.isSelected.rawValue] as? Bool
        obj.quatity = json[CodingKeys.quatity.rawValue] as? String
        obj.catID = json[CodingKeys.catID.rawValue] as? String
        obj.catName = json[CodingKeys.catName.rawValue] as? String
        obj.notes = json[CodingKeys.notes.rawValue] as? String
        
        if let arrayImages = json[CodingKeys.arrayImages.rawValue] as? [[String:Any]] {
            obj.arrayImages?.removeAll()
            for singleImage in arrayImages {
                let imageObj = ImagesArrayData.initFrom(json: singleImage)
                obj.arrayImages?.append(imageObj)
            }
        }
        
        if let imageBase64String = json[CodingKeys.image2.rawValue] as? String {
            if let data = Data(base64Encoded: imageBase64String) {
                obj.image2 = UIImage(data: data)
            }
        }
        
        
        return obj
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
        try container.encode(notes, forKey: .notes)
        try container.encode(name, forKey: .name)
        try container.encode(isSelected, forKey: .isSelected)
        try container.encode(quatity, forKey: .quatity)
        try container.encode(catID, forKey: .catID)
        try container.encode(catName, forKey: .catName)
        try container.encode(arrayImages, forKey: .arrayImages)
        
        if let image = image2, let data = image.pngData() {
            try container.encode(data, forKey: .image2)
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        isSelected = try container.decode(Bool.self, forKey: .isSelected)
        quatity = try container.decode(String.self, forKey: .quatity)
        catID = try container.decode(String.self, forKey: .catID)
        catName = try container.decode(String.self, forKey: .catName)
        image = try container.decode(String.self, forKey: .image)
        notes = try container.decode(String.self, forKey: .notes)
        arrayImages = try container.decode([ImagesArrayData].self, forKey: .arrayImages)
        
        if let text = try container.decodeIfPresent(String.self, forKey: .image2) {
            if let data = Data(base64Encoded: text) {
                image2 = UIImage(data: data)
            }
        }
        
    }
    
    init(name : String, image : String, isSelected : Bool , catID : String, catName : String, quantity : String, array: [ImagesArrayData], image2 : UIImage, notes : String)  {
        
        self.image = image
        self.name = name
        self.isSelected = isSelected
        self.catID = catID
        self.catName = catName
        self.quatity = quantity
        self.arrayImages =  array
        self.image2 = image2
        self.notes  =  notes
    }
    
}

struct ImagesArrayData : Codable{
    
    var image : UIImage?
    var name : String?
    
    public enum CodingKeys: String, CodingKey {
        case image
        case name
        
    }
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> ImagesArrayData{
        var obj = ImagesArrayData()
        obj.name = json[CodingKeys.name.rawValue] as? String
        
        if let imageBase64String = json[CodingKeys.image.rawValue] as? String {
            if let data = Data(base64Encoded: imageBase64String) {
                obj.image = UIImage(data: data)
            }
        }
        
        return obj
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        
        if let image = image, let data = image.pngData() {
            try container.encode(data, forKey: .image)
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        
        if let text = try container.decodeIfPresent(String.self, forKey: .image) {
            if let data = Data(base64Encoded: text) {
                image = UIImage(data: data)
            }
        }
        
    }
    
    init(name : String, image : UIImage )  {
        self.image = image
        self.name = name
        
    }
    
}
