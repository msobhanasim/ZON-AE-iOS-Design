/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OrderData : Codable {
	var order_name : String?
	var order_id : String?
	var image_count : Int?
	var order_quantity : String?
	var address : OrderAddress?
	var images : [OrderImages]?
	var date_order : Int?
	var is_offer : String?
	var quotation_count : Int?
	var least_price : String?
	var is_deliver : String?
	var is_accept : String?
	var date_deliver : String?
	var comment : String?

	enum CodingKeys: String, CodingKey {

		case order_name = "order_name"
		case order_id = "order_id"
		case image_count = "image_count"
		case order_quantity = "order_quantity"
		case address = "address"
		case images = "images"
		case date_order = "date_order"
		case is_offer = "is_offer"
		case quotation_count = "quotation_count"
		case least_price = "least_price"
		case is_deliver = "is_deliver"
		case is_accept = "is_accept"
		case date_deliver = "date_deliver"
		case comment = "comment"
	}
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> OrderData{
        var obj = OrderData()
        
        obj.order_name = json[CodingKeys.order_name.rawValue] as? String
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.image_count = json[CodingKeys.image_count.rawValue] as? Int
        obj.order_quantity = json[CodingKeys.order_quantity.rawValue] as? String
        if let address = json[CodingKeys.address.rawValue] as? [String:Any]{
            let addressObj = OrderAddress.initFrom(json: address)
            obj.address = addressObj
        }
        
        if let images = json[CodingKeys.images.rawValue] as? [[String:Any]]{
            obj.images?.removeAll()
            for singleImage in images {
                let image = OrderImages.initFrom(json: singleImage)
                obj.images?.append(image)
            }
        }
        
        obj.date_order = json[CodingKeys.date_order.rawValue] as? Int
        obj.is_offer = json[CodingKeys.is_offer.rawValue] as? String
        obj.quotation_count = json[CodingKeys.quotation_count.rawValue] as? Int
        obj.least_price = json[CodingKeys.least_price.rawValue] as? String
        obj.is_deliver = json[CodingKeys.is_deliver.rawValue] as? String
        obj.is_accept = json[CodingKeys.is_accept.rawValue] as? String
        obj.date_deliver = json[CodingKeys.date_deliver.rawValue] as? String
        obj.comment = json[CodingKeys.comment.rawValue] as? String
        
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		order_name = try values.decodeIfPresent(String.self, forKey: .order_name)
		order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
		image_count = try values.decodeIfPresent(Int.self, forKey: .image_count)
		order_quantity = try values.decodeIfPresent(String.self, forKey: .order_quantity)
		address = try values.decodeIfPresent(OrderAddress.self, forKey: .address)
		images = try values.decodeIfPresent([OrderImages].self, forKey: .images)
		date_order = try values.decodeIfPresent(Int.self, forKey: .date_order)
		is_offer = try values.decodeIfPresent(String.self, forKey: .is_offer)
		quotation_count = try values.decodeIfPresent(Int.self, forKey: .quotation_count)
		least_price = try values.decodeIfPresent(String.self, forKey: .least_price)
		is_deliver = try values.decodeIfPresent(String.self, forKey: .is_deliver)
		is_accept = try values.decodeIfPresent(String.self, forKey: .is_accept)
		date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
	}

}
