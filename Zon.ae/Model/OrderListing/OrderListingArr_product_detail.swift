/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct OrderListingArr_product_detail : Codable {
    var price : String?
    var is_delivered : String?
    var purchase_date : Int?
    var quantity : String?
    var product_name : String?
    var seller_name : String?
    var seller : OrderListingSeller?
    var image : String?
    var quotation_id : String?
    var date_order : Int?
    var phone_no : String?
    var product_id : String?
    var vat : String?
    var order_id : String?
    var comment : String?
    var date_deliver : String?
    var hrs : String?
    var customer_image : String?
    var trade_license_nr : String?
    var mins : String?
    var is_image_request : String?
    var delivery_fee : String?
    var full_address : String?
    var seller_id : String?
    var is_accept : String?
    var order_quantity : String?
//    let images : [String]?
//    let size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case price = "price"
        case is_delivered = "is_delivered"
        case purchase_date = "purchase_date"
        case quantity = "quantity"
        case product_name = "product_name"
        case seller_name = "seller_name"
        case seller = "seller"
        case image = "image"
        case quotation_id = "quotation_id"
        case date_order = "date_order"
        case phone_no = "phone_no"
        case product_id = "product_id"
        case vat = "vat"
        case order_id = "order_id"
        case comment = "comment"
        case date_deliver = "date_deliver"
        case hrs = "hrs"
        case customer_image = "customer_image"
        case trade_license_nr = "trade_license_nr"
        case mins = "mins"
        case is_image_request = "is_image_request"
        case delivery_fee = "delivery_fee"
        case full_address = "full_address"
        case seller_id = "seller_id"
        case is_accept = "is_accept"
        case order_quantity = "order_quantity"
//        case images = "images"
        
    }
  
    init(){ }

    static func initFrom(json:[String:Any]) -> OrderListingArr_product_detail{
        
        var obj = OrderListingArr_product_detail()
        obj.price = json[CodingKeys.price.rawValue] as? String
        obj.is_delivered = json[CodingKeys.is_delivered.rawValue] as? String
        obj.purchase_date = json[CodingKeys.purchase_date.rawValue] as? Int
        obj.quantity = json[CodingKeys.quantity.rawValue] as? String
        obj.product_name = json[CodingKeys.product_name.rawValue] as? String
        obj.seller_name = json[CodingKeys.seller_name.rawValue] as? String
        if let seller = json[CodingKeys.seller.rawValue] as? [String:Any] {
            let sellerObj = OrderListingSeller.initFrom(json: seller)
            obj.seller = sellerObj
        }
        obj.image = json[CodingKeys.image.rawValue] as? String
        obj.quotation_id = json[CodingKeys.quotation_id.rawValue] as? String
        obj.date_order = json[CodingKeys.date_order.rawValue] as? Int
        obj.phone_no = json[CodingKeys.phone_no.rawValue] as? String
        obj.product_id = json[CodingKeys.product_id.rawValue] as? String
        obj.vat = json[CodingKeys.vat.rawValue] as? String
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.comment = json[CodingKeys.comment.rawValue] as? String
        obj.date_deliver = json[CodingKeys.date_deliver.rawValue] as? String
        obj.hrs = json[CodingKeys.hrs.rawValue] as? String
        obj.customer_image = json[CodingKeys.customer_image.rawValue] as? String
        obj.trade_license_nr = json[CodingKeys.trade_license_nr.rawValue] as? String
        obj.mins = json[CodingKeys.mins.rawValue] as? String
        obj.is_image_request = json[CodingKeys.is_image_request.rawValue] as? String
        obj.delivery_fee = json[CodingKeys.delivery_fee.rawValue] as? String
        obj.full_address = json[CodingKeys.full_address.rawValue] as? String
        obj.seller_id = json[CodingKeys.seller_id.rawValue] as? String
        obj.is_accept = json[CodingKeys.is_accept.rawValue] as? String
        obj.order_quantity = json[CodingKeys.order_quantity.rawValue] as? String
        
        
        return obj
    }
    
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        is_delivered = try values.decodeIfPresent(String.self, forKey: .is_delivered)
        purchase_date = try values.decodeIfPresent(Int.self, forKey: .purchase_date)
        quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
        seller = try values.decodeIfPresent(OrderListingSeller.self, forKey: .seller)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        quotation_id = try values.decodeIfPresent(String.self, forKey: .quotation_id)
        date_order = try values.decodeIfPresent(Int.self, forKey: .date_order)
        phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        vat = try values.decodeIfPresent(String.self, forKey: .vat)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        
        do{
            date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
        }
        catch{
            date_deliver = String(describing: try values.decodeIfPresent(Int.self, forKey: .date_deliver)!)
        }
        hrs = try values.decodeIfPresent(String.self, forKey: .hrs)
        customer_image = try values.decodeIfPresent(String.self, forKey: .customer_image)
        trade_license_nr = try values.decodeIfPresent(String.self, forKey: .trade_license_nr)
        mins = try values.decodeIfPresent(String.self, forKey: .mins)
        is_image_request = try values.decodeIfPresent(String.self, forKey: .is_image_request)
        delivery_fee = try values.decodeIfPresent(String.self, forKey: .delivery_fee)
        full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
        seller_id = try values.decodeIfPresent(String.self, forKey: .seller_id)
        is_accept = try values.decodeIfPresent(String.self, forKey: .is_accept)
        order_quantity = try values.decodeIfPresent(String.self, forKey: .order_quantity)
//        images = try values.decodeIfPresent([String].self, forKey: .images)
//        size = try values.decodeIfPresent(String.self, forKey: .size)
        
        
    }
    
}
