/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OrderAddress : Codable {
	var address_id : String?
	var address_name : String?
	var city_id : String?
	var area_id : String?
	var full_address : String?
	var current_location : String?
	var building_name : String?
	var office_room_no : String?
	var status : String?
	var is_primary : String?
	var city : String?
	var area : String?
	var lat : Double?
	var lng : Double?

	enum CodingKeys: String, CodingKey {

		case address_id = "address_id"
		case address_name = "address_name"
		case city_id = "city_id"
		case area_id = "area_id"
		case full_address = "full_address"
		case current_location = "current_location"
		case building_name = "building_name"
		case office_room_no = "office_room_no"
		case status = "status"
		case is_primary = "is_primary"
		case city = "city"
		case area = "area"
		case lat = "lat"
		case lng = "lng"
	}
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> OrderAddress{
        var obj = OrderAddress()
        
        obj.address_id = json[CodingKeys.address_id.rawValue] as? String
        obj.address_name = json[CodingKeys.address_name.rawValue] as? String
        obj.city_id = json[CodingKeys.city_id.rawValue] as? String
        obj.area_id = json[CodingKeys.area_id.rawValue] as? String
        obj.full_address = json[CodingKeys.full_address.rawValue] as? String
        obj.current_location = json[CodingKeys.current_location.rawValue] as? String
        obj.building_name = json[CodingKeys.building_name.rawValue] as? String
        obj.office_room_no = json[CodingKeys.office_room_no.rawValue] as? String
        obj.status = json[CodingKeys.status.rawValue] as? String
        obj.is_primary = json[CodingKeys.is_primary.rawValue] as? String
        obj.city = json[CodingKeys.city.rawValue] as? String
        obj.area = json[CodingKeys.area.rawValue] as? String
        obj.lat = json[CodingKeys.lat.rawValue] as? Double
        obj.lng = json[CodingKeys.lng.rawValue] as? Double
        
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
		address_name = try values.decodeIfPresent(String.self, forKey: .address_name)
		city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
		area_id = try values.decodeIfPresent(String.self, forKey: .area_id)
		full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
		current_location = try values.decodeIfPresent(String.self, forKey: .current_location)
		building_name = try values.decodeIfPresent(String.self, forKey: .building_name)
		office_room_no = try values.decodeIfPresent(String.self, forKey: .office_room_no)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		is_primary = try values.decodeIfPresent(String.self, forKey: .is_primary)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		area = try values.decodeIfPresent(String.self, forKey: .area)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
	}

}
