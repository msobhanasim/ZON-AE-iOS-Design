//
//  AddItemInfo.swift
//  ZON
//
//  Created by Apple PC on 15/07/2020.
// 
//


import Foundation

struct AddItemData:  Codable {
    var catID : String?
    var catName : String?
    var name : String?
    var image : String?
    var quatity : String?
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> AddItemData{
        var obj = AddItemData()
        obj.catID = json[CodingKeys.catID.stringValue] as? String
        obj.catName = json[CodingKeys.catName.stringValue] as? String
        obj.name = json[CodingKeys.name.stringValue] as? String
        obj.image = json[CodingKeys.image.stringValue] as? String
        obj.quatity = json[CodingKeys.quatity.stringValue] as? String
        
        return obj
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        catID = try values.decodeIfPresent(String.self, forKey: .catID)
        catName = try values.decodeIfPresent(String.self, forKey: .catName)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        quatity = try values.decodeIfPresent(String.self, forKey: .quatity)
        
    }
    
    
}

struct AddItemInfo : Codable {
    var items : [CroppedImageData]?
   
    func saveCurrentSession(forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: forKey)
        }
    }
}

struct AddToCartData : Codable {
    var quotation_id  = [CartData]()
    var arr_product_detail = [Arr_product_detail]()

    func saveCurrentSession(forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: forKey)
        }
    }
}

struct FilterData : Codable {
    var price  = ""
    var distance = ""
    var estimated_delivert = ""
    var rating  = ""
    var product_id  = [Int]()

    func saveCurrentSession(forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: forKey)
        }
    }
}

struct CartData : Codable{
    var od_id : String?
    var address_id : String?
    var quantity : String?
    var quotation_id : String?
    var brandName : String?
    var image : String?

    public enum CodingKeys: String, CodingKey {
        case od_id
        case address_id
        case quantity
        case quotation_id
        case brandName
        case image
    }
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> CartData{
        var obj = CartData()
        obj.od_id = json[CodingKeys.od_id.rawValue] as? String
        obj.address_id = json[CodingKeys.address_id.rawValue] as? String
        obj.quantity = json[CodingKeys.quantity.rawValue] as? String
        obj.quotation_id = json[CodingKeys.quotation_id.rawValue] as? String
        obj.brandName = json[CodingKeys.brandName.rawValue] as? String
        obj.image = json[CodingKeys.image.rawValue] as? String
        
        return obj
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(od_id, forKey: .od_id)
        try container.encode(address_id, forKey: .address_id)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(quotation_id, forKey: .quotation_id)
        try container.encode(brandName, forKey: .brandName)
        try container.encode(image, forKey: .image)
 
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address_id = try container.decode(String.self, forKey: .address_id)
        od_id = try container.decode(String.self, forKey: .od_id)
        quantity = try container.decode(String.self, forKey: .quantity)
        quotation_id = try container.decode(String.self, forKey: .quotation_id)
        brandName = try container.decode(String.self, forKey: .quantity)
        image = try container.decode(String.self, forKey: .image)

    }
    
    init(address_id : String, od_id : String,quantity: String, quotation_id :String , brandName: String, image : String)  {
        
        self.od_id = od_id
        self.address_id = address_id
        self.quantity = quantity
        self.quotation_id = quotation_id
        self.brandName = brandName
        self.image = image

    }
    
}
