/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OrderListingSeller : Codable {
	var seller_id : String?
	var seller_name : String?
	var phone_no : String?
	var full_address : String?
	var trade_license_nr : String?
	var categories : [String]?
	var rating : String?
	var lat : Double?
	var lng : Double?
	var company_pic : String?
	var business_card_pic : String?
	var logo : String?

	enum CodingKeys: String, CodingKey {

		case seller_id = "seller_id"
		case seller_name = "seller_name"
		case phone_no = "phone_no"
		case full_address = "full_address"
		case trade_license_nr = "trade_license_nr"
		case categories = "categories"
		case rating = "rating"
		case lat = "lat"
		case lng = "lng"
		case company_pic = "company_pic"
		case business_card_pic = "business_card_pic"
		case logo = "logo"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> OrderListingSeller{
        
        var obj = OrderListingSeller()
        
        obj.seller_id = json[CodingKeys.seller_id.rawValue] as? String
        obj.seller_name = json[CodingKeys.seller_name.rawValue] as? String
        obj.phone_no = json[CodingKeys.phone_no.rawValue] as? String
        obj.full_address = json[CodingKeys.full_address.rawValue] as? String
        obj.trade_license_nr = json[CodingKeys.trade_license_nr.rawValue] as? String
        if let categories = json[CodingKeys.categories.rawValue] as? [String] {
            obj.categories?.removeAll()
            for singleCategory in categories {
                obj.categories?.append(singleCategory)
            }
        }
        obj.rating = json[CodingKeys.rating.rawValue] as? String
        obj.lat = json[CodingKeys.lat.rawValue] as? Double
        obj.lng = json[CodingKeys.lng.rawValue] as? Double
        obj.company_pic = json[CodingKeys.company_pic.rawValue] as? String
        obj.business_card_pic = json[CodingKeys.business_card_pic.rawValue] as? String
        obj.logo = json[CodingKeys.logo.rawValue] as? String
        
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		seller_id = try values.decodeIfPresent(String.self, forKey: .seller_id)
		seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
		phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
		full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
		trade_license_nr = try values.decodeIfPresent(String.self, forKey: .trade_license_nr)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		company_pic = try values.decodeIfPresent(String.self, forKey: .company_pic)
		business_card_pic = try values.decodeIfPresent(String.self, forKey: .business_card_pic)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
	}

}
