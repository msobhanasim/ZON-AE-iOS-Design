//
//  HomeObj.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 17/10/2021.
//

import Foundation

struct HomeObj : Codable {
    var slides : [Slide]?
    var categories : [Categorydata]?
    var recent_orders : [OrderData]?
    var labels : LabelObj?

    enum CodingKeys: String, CodingKey {

        case slides = "slides"
        case categories = "categories"
        case recent_orders = "recent_orders"
        case labels = "labels"
        
    }
    
    init(){ }

    static func initFrom(json:[String:Any]) -> HomeObj{
        
        var obj = HomeObj()
        if let slidesArr = json[CodingKeys.slides.rawValue] as? [[String:Any]]{
            obj.slides?.removeAll()
            for singleSlide in slidesArr {
                let slide = Slide.initFrom(json: singleSlide)
                obj.slides?.append(slide)
            }
        }
        
        if let categoriesArr = json[CodingKeys.categories.rawValue] as? [[String:Any]]{
            obj.categories?.removeAll()
            for singleCategory in categoriesArr {
                let category = Categorydata.initFrom(json: singleCategory)
                obj.categories?.append(category)
            }
        }
        
        if let recentOrderesArr = json[CodingKeys.recent_orders.rawValue] as? [[String:Any]]{
            obj.recent_orders?.removeAll()
            for singleRecentOrder in recentOrderesArr {
                let order = OrderData.initFrom(json: singleRecentOrder)
                obj.recent_orders?.append(order)
            }
        }
        
        if let buttonLabelObject = json[CodingKeys.labels.rawValue] as? [String:Any]{
            obj.labels = LabelObj.initFrom(json: buttonLabelObject)
        }
        
        return obj
    }

}

