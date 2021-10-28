//
//  Slide.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 17/10/2021.
//

import Foundation

struct Slide : Codable {
    var url: String?
    var heading: String?
    var sub_heading: String?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case heading = "heading"
        case sub_heading = "sub_heading"
       
    }

    init(){ }

    static func initFrom(json:[String:Any]) -> Slide{
        
        var obj = Slide()
        obj.url = json[CodingKeys.url.rawValue] as? String
        obj.heading = json[CodingKeys.heading.rawValue] as? String
        obj.sub_heading = json[CodingKeys.sub_heading.rawValue] as? String
        
        return obj
    }

    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        url = try values.decodeIfPresent(String.self, forKey: .url)
        heading = try values.decodeIfPresent(String.self, forKey: .heading)
        sub_heading = try values.decodeIfPresent(String.self, forKey: .sub_heading)
        
    }

}
