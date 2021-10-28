/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NotificationData : Codable {
	var order_id : String?
	var image : String?
	var seller_name : String?
	var item_name : String?
	var price : String?
	var ordered_status : String?
	var is_delivered : String?
	var date : Int?
	var title1 : String?
	var title2 : String?

	enum CodingKeys: String, CodingKey {

		case order_id = "order_id"
		case image = "image"
		case seller_name = "seller_name"
		case item_name = "item_name"
		case price = "price"
		case ordered_status = "ordered_status"
		case is_delivered = "is_delivered"
		case date = "date"
		case title1 = "title1"
		case title2 = "title2"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> NotificationData{
        
        var obj = NotificationData()
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.image = json[CodingKeys.image.rawValue] as? String
        obj.seller_name = json[CodingKeys.seller_name.rawValue] as? String
        obj.item_name = json[CodingKeys.item_name.rawValue] as? String
        obj.price = json[CodingKeys.price.rawValue] as? String
        obj.ordered_status = json[CodingKeys.ordered_status.rawValue] as? String
        obj.is_delivered = json[CodingKeys.is_delivered.rawValue] as? String
        obj.date = json[CodingKeys.date.rawValue] as? Int
        obj.title1 = json[CodingKeys.title1.rawValue] as? String
        obj.title2 = json[CodingKeys.title2.rawValue] as? String
        
        return obj
    }


	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
		item_name = try values.decodeIfPresent(String.self, forKey: .item_name)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		ordered_status = try values.decodeIfPresent(String.self, forKey: .ordered_status)
		is_delivered = try values.decodeIfPresent(String.self, forKey: .is_delivered)
		date = try values.decodeIfPresent(Int.self, forKey: .date)
		title1 = try values.decodeIfPresent(String.self, forKey: .title1)
		title2 = try values.decodeIfPresent(String.self, forKey: .title2)
	}

}
