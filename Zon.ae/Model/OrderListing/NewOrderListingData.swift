/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NewOrderListingData : Codable {
	var order_id : String?
	var order_title : String?
	var is_delivered : String?
    var total_price : String?
	var sellers : [NewOrderListingSellers]?
	var quotation_count : String?
	var date_deliver : String?
	var date_order : Int?
	var order_name : String?
	var price : String?

	enum CodingKeys: String, CodingKey {

		case order_id = "order_id"
		case order_title = "order_title"
		case is_delivered = "is_delivered"
		case sellers = "sellers"
		case quotation_count = "quotation_count"
		case date_deliver = "date_deliver"
		case date_order = "date_order"
		case order_name = "order_name"
        case total_price = "total_price"
		case price = "price"
	}
    
    init(){}
    

    static func initFrom(json:[String:Any]) -> NewOrderListingData{
        
        var obj = NewOrderListingData()
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.order_title = json[CodingKeys.order_title.rawValue] as? String
        obj.is_delivered = json[CodingKeys.is_delivered.rawValue] as? String
        if let sellers = json[CodingKeys.sellers.rawValue] as? [[String:Any]]{
            obj.sellers?.removeAll()
            for singleSeller in sellers {
                let seller = NewOrderListingSellers.initFrom(json: singleSeller)
                obj.sellers?.append(seller)
            }
        }
        obj.quotation_count = json[CodingKeys.quotation_count.rawValue] as? String
        obj.date_deliver = json[CodingKeys.date_deliver.rawValue] as? String
        obj.date_order = json[CodingKeys.date_order.rawValue] as? Int
        obj.order_name = json[CodingKeys.order_name.rawValue] as? String
        obj.total_price = json[CodingKeys.total_price.rawValue] as? String
        obj.price = json[CodingKeys.price.rawValue] as? String
        
        
        
        return obj
    }
    
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
		order_title = try values.decodeIfPresent(String.self, forKey: .order_title)
		is_delivered = try values.decodeIfPresent(String.self, forKey: .is_delivered)
		sellers = try values.decodeIfPresent([NewOrderListingSellers].self, forKey: .sellers)
		quotation_count = try values.decodeIfPresent(String.self, forKey: .quotation_count)
        do{
              date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
          }
          catch{
              date_deliver = String(describing: try values.decodeIfPresent(Int.self, forKey: .date_deliver)!)
          }
        date_order = try values.decodeIfPresent(Int.self, forKey: .date_order)
		order_name = try values.decodeIfPresent(String.self, forKey: .order_name)
        total_price = try values.decodeIfPresent(String.self, forKey: .total_price)

		price = try values.decodeIfPresent(String.self, forKey: .price)
	}

}
