/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct NewOrderListingSellers : Codable {
    var seller_id : String?
    var max_time : String?
    var current_time : String?
    var max_delivery_time : String?
    var max_delivery_timestamp : Int?
    var max_days : String?
    var max_hrs : String?
    var max_mins : String?
    var eta_expired : Int?
    var seller_name : String?
    var products_arr : [Products_arr]?
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
    var have_invoice : String?
    var invoice_paths : [String]?
    var invoice_time : String?
    
    enum CodingKeys: String, CodingKey {
        case max_hrs  = "max_hours"
        case max_days = "max_days"
        case max_mins =  "max_mins"
        case have_invoice = "have_invoice"
        case invoice_paths = "invoice_paths"
        case invoice_time = "invoice_time"
        case seller_id = "seller_id"
        case max_time = "max_time"
        case current_time = "current_time"
        case max_delivery_time = "max_delivery_time"
        case max_delivery_timestamp = "max_delivery_timestamp"
        case eta_expired = "eta_expired"
        case seller_name = "seller_name"
        case products_arr = "products_arr"
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

    static func initFrom(json:[String:Any]) -> NewOrderListingSellers{
        
        var obj = NewOrderListingSellers()
        
        obj.seller_id = json[CodingKeys.seller_id.rawValue] as? String
        obj.seller_name = json[CodingKeys.seller_name.rawValue] as? String
        obj.phone_no = json[CodingKeys.phone_no.rawValue] as? String
        obj.full_address = json[CodingKeys.full_address.rawValue] as? String
        obj.trade_license_nr = json[CodingKeys.trade_license_nr.rawValue] as? String
        obj.max_hrs = json[CodingKeys.max_hrs.rawValue] as? String
        obj.max_days = json[CodingKeys.max_days.rawValue] as? String
        obj.max_mins = json[CodingKeys.max_mins.rawValue] as? String
        obj.have_invoice = json[CodingKeys.have_invoice.rawValue] as? String
        obj.invoice_time = json[CodingKeys.invoice_time.rawValue] as? String
        obj.max_time = json[CodingKeys.max_time.rawValue] as? String
        obj.current_time = json[CodingKeys.current_time.rawValue] as? String
        obj.max_delivery_time = json[CodingKeys.max_delivery_time.rawValue] as? String
        obj.max_delivery_timestamp = json[CodingKeys.max_delivery_timestamp.rawValue] as? Int
        obj.eta_expired = json[CodingKeys.eta_expired.rawValue] as? Int
        
        if let productDetails = json[CodingKeys.products_arr.rawValue] as? [[String:Any]]{
            obj.products_arr?.removeAll()
            for singleProductDetail in productDetails {
                let detail = Products_arr.initFrom(json: singleProductDetail)
                obj.products_arr?.append(detail)
            }
        }
        
        if let categories = json[CodingKeys.categories.rawValue] as? [String] {
            obj.categories?.removeAll()
            for singleCategory in categories {
                obj.categories?.append(singleCategory)
            }
        }
        
        if let invoicePaths = json[CodingKeys.invoice_paths.rawValue] as? [String] {
            obj.invoice_paths?.removeAll()
            for singlePath in invoicePaths {
                obj.invoice_paths?.append(singlePath)
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
        
        max_days = try values.decodeIfPresent(String.self, forKey: .max_days)
        max_hrs = try values.decodeIfPresent(String.self, forKey: .max_hrs)
        max_mins = try values.decodeIfPresent(String.self, forKey: .max_mins)
        
        
        have_invoice = try values.decodeIfPresent(String.self, forKey: .have_invoice)
        invoice_paths = try values.decodeIfPresent([String].self, forKey: .invoice_paths)
        invoice_time = try values.decodeIfPresent(String.self, forKey: .invoice_time)
        
        seller_id = try values.decodeIfPresent(String.self, forKey: .seller_id)
        max_time = try values.decodeIfPresent(String.self, forKey: .max_time)
        current_time = try values.decodeIfPresent(String.self, forKey: .current_time)
        max_delivery_time = try values.decodeIfPresent(String.self, forKey: .max_delivery_time)
        max_delivery_timestamp = try values.decodeIfPresent(Int.self, forKey: .max_delivery_timestamp)
        eta_expired = try values.decodeIfPresent(Int.self, forKey: .eta_expired)
        seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
        products_arr = try values.decodeIfPresent([Products_arr].self, forKey: .products_arr)
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
