/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct OrderListingData : Codable {
    var order_id : String?
    var is_delivered : String?
    var arr_product_detail : [OrderListingArr_product_detail]?
    var quotation_count : String?
    var date_deliver : String?
    var date_order : Int?
    var order_name : String?
    var price : String?
    
    enum CodingKeys: String, CodingKey {
        
        case order_id = "order_id"
        case is_delivered = "is_delivered"
        case arr_product_detail = "arr_product_detail"
        case quotation_count = "quotation_count"
        case date_deliver = "date_deliver"
        case date_order = "date_order"
        case order_name = "order_name"
        case price = "price"
    }
    
    init(){ }

    static func initFrom(json:[String:Any]) -> OrderListingData{
        
        var obj = OrderListingData()
        
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.is_delivered = json[CodingKeys.is_delivered.rawValue] as? String
        
        if let productDetails = json[CodingKeys.arr_product_detail.rawValue] as? [[String:Any]]{
            obj.arr_product_detail?.removeAll()
            for singleProductDetail in productDetails {
                let detail = OrderListingArr_product_detail.initFrom(json: singleProductDetail)
                obj.arr_product_detail?.append(detail)
            }
        }
        obj.quotation_count = json[CodingKeys.quotation_count.rawValue] as? String
        obj.date_deliver = json[CodingKeys.date_deliver.rawValue] as? String
        obj.date_order = json[CodingKeys.date_order.rawValue] as? Int
        obj.order_name = json[CodingKeys.order_name.rawValue] as? String
        obj.price = json[CodingKeys.price.rawValue] as? String
        
        return obj
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        is_delivered = try values.decodeIfPresent(String.self, forKey: .is_delivered)
        arr_product_detail = try values.decodeIfPresent([OrderListingArr_product_detail].self, forKey: .arr_product_detail)
        quotation_count = try values.decodeIfPresent(String.self, forKey: .quotation_count)
        date_order = try values.decodeIfPresent(Int.self, forKey: .date_order)
        do{
            date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
        }
        catch{
            date_deliver = String(describing: try values.decodeIfPresent(Int.self, forKey: .date_deliver)!)
        }
        order_name = try values.decodeIfPresent(String.self, forKey: .order_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
    }
    
}
