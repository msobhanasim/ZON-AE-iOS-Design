//
//  LabelObj.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 17/10/2021.
//

import Foundation

struct LabelAndButtonsText : Codable {
    var title : String?
    var button: String?

    enum CodingKeys: String, CodingKey {
        case title  = "title"
        case button = "button"
        
    }

    init(){ }

    static func initFrom(json:[String:Any]) -> LabelAndButtonsText{
        
        var obj = LabelAndButtonsText()
        obj.title = json[CodingKeys.title.rawValue] as? String
        obj.button = json[CodingKeys.button.rawValue] as? String
        
        return obj
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        button = try values.decodeIfPresent(String.self, forKey: .button)
    }

}

struct LabelObj : Codable {
    var categories_labels : LabelAndButtonsText?
    var recent_orders: LabelAndButtonsText?

    enum CodingKeys: String, CodingKey {
        case categories_labels  = "categories_labels"
        case recent_orders = "recent_orders"
        
    }

    init(){ }

    static func initFrom(json:[String:Any]) -> LabelObj{
        
        var obj = LabelObj()
        if let categories_labels_object = json[CodingKeys.categories_labels.rawValue] as? [String:Any]{
            obj.categories_labels = LabelAndButtonsText.initFrom(json: categories_labels_object)
        }
        
        if let recent_orders_object = json[CodingKeys.recent_orders.rawValue] as? [String:Any]{
            obj.recent_orders = LabelAndButtonsText.initFrom(json: recent_orders_object)
        }
        
        return obj
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_labels = try values.decodeIfPresent(LabelAndButtonsText.self, forKey: .categories_labels)
        recent_orders = try values.decodeIfPresent(LabelAndButtonsText.self, forKey: .recent_orders)
    }
    
}
