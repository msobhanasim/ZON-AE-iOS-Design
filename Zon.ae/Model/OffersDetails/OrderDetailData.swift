/* 
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct OrderDetailData : Codable {
    var order_name : String?
    var product_name : String?
    var seller_id : String?
    var seller_name : String?
    var phone_no : String?
    var full_address : String?
    var trade_license_nr : String?
    var categories : [String]?
    var image_count : Int?
    var is_image_request : String?
    var order_quantity : String?
    var price : String?
    var quotation_id : String?
    var is_accept : String?
    var date_order : String?
    var is_deliver : String?
    var date_deliver : String?
    var comment : String?
    var hrs : String?
    var mins : String?
    var days : String?

    var rating : String?
    var lat : Double?
    var lng : Double?
    var address : OrderDetailAddress?
    var customer_lat : Double?
    var customer_lng : Double?
    var company_pic : String?
    var business_card_pic : String?
    var logo : String?
    var arr_product_detail : [Arr_product_detail]?
    var product_detail : String?
    var is_package : String?
    var distance : String?
    
    enum CodingKeys: String, CodingKey {
        case days = "days"
        case order_name = "order_name"
        case product_name = "product_name"
        case seller_id = "seller_id"
        case seller_name = "seller_name"
        case phone_no = "phone_no"
        case full_address = "full_address"
        case trade_license_nr = "trade_license_nr"
        case categories = "categories"
        case image_count = "image_count"
        case is_image_request = "is_image_request"
        case order_quantity = "order_quantity"
        case price = "price"
        case quotation_id = "quotation_id"
        case is_accept = "is_accept"
        case date_order = "date_order"
        case is_deliver = "is_deliver"
        case date_deliver = "date_deliver"
        case comment = "comment"
        case hrs = "hrs"
        case mins = "mins"
        case rating = "rating"
        case lat = "lat"
        case lng = "lng"
        case address = "address"
        case customer_lat = "customer_lat"
        case customer_lng = "customer_lng"
        case company_pic = "company_pic"
        case business_card_pic = "business_card_pic"
        case logo = "logo"
        case arr_product_detail = "arr_product_detail"
        case product_detail = "product_detail"
        case is_package = "is_package"
        case distance = "distance"
    }
    
    init(){ }

    static func initFrom(json:[String:Any]) -> OrderDetailData{
        
        var obj = OrderDetailData()
        obj.days = json[CodingKeys.days.rawValue] as? String
        obj.order_name = json[CodingKeys.order_name.rawValue] as? String
        obj.product_name = json[CodingKeys.product_name.rawValue] as? String
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
        
        obj.image_count = json[CodingKeys.image_count.rawValue] as? Int
        obj.is_image_request = json[CodingKeys.is_image_request.rawValue] as? String
        obj.order_quantity = json[CodingKeys.order_quantity.rawValue] as? String
        obj.price = json[CodingKeys.price.rawValue] as? String
        obj.quotation_id = json[CodingKeys.quotation_id.rawValue] as? String
        obj.is_accept = json[CodingKeys.is_accept.rawValue] as? String
        obj.date_order = json[CodingKeys.date_order.rawValue] as? String
        obj.is_deliver = json[CodingKeys.is_deliver.rawValue] as? String
        obj.date_deliver = json[CodingKeys.date_deliver.rawValue] as? String
        obj.comment = json[CodingKeys.comment.rawValue] as? String
        obj.hrs = json[CodingKeys.hrs.rawValue] as? String
        obj.mins = json[CodingKeys.mins.rawValue] as? String
        obj.rating = json[CodingKeys.rating.rawValue] as? String
        obj.lat = json[CodingKeys.lat.rawValue] as? Double
        obj.lng = json[CodingKeys.lng.rawValue] as? Double
        
        if let address = json[CodingKeys.address.rawValue] as? [String:Any]{
            let adressObj = OrderDetailAddress.initFrom(json: address)
            obj.address = adressObj
        }
        
        obj.customer_lat = json[CodingKeys.customer_lat.rawValue] as? Double
        obj.customer_lng = json[CodingKeys.customer_lng.rawValue] as? Double
        obj.company_pic = json[CodingKeys.company_pic.rawValue] as? String
        obj.business_card_pic = json[CodingKeys.business_card_pic.rawValue] as? String
        obj.logo = json[CodingKeys.logo.rawValue] as? String
        
        if let productDetails = json[CodingKeys.arr_product_detail.rawValue] as? [[String:Any]]{
            obj.arr_product_detail?.removeAll()
            for singleProductDetail in productDetails {
                let detail = Arr_product_detail.initFrom(json: singleProductDetail)
                obj.arr_product_detail?.append(detail)
            }
        }
        
        obj.product_detail = json[CodingKeys.product_detail.rawValue] as? String
        obj.is_package = json[CodingKeys.is_package.rawValue] as? String
        obj.distance = json[CodingKeys.distance.rawValue] as? String
        
        return obj
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        days = try values.decodeIfPresent(String.self, forKey: .days)

        order_name = try values.decodeIfPresent(String.self, forKey: .order_name)
        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        seller_id = try values.decodeIfPresent(String.self, forKey: .seller_id)
        seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
        phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
        full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
        trade_license_nr = try values.decodeIfPresent(String.self, forKey: .trade_license_nr)
        categories = try values.decodeIfPresent([String].self, forKey: .categories)
        image_count = try values.decodeIfPresent(Int.self, forKey: .image_count)
        is_image_request = try values.decodeIfPresent(String.self, forKey: .is_image_request)
        order_quantity = try values.decodeIfPresent(String.self, forKey: .order_quantity)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        quotation_id = try values.decodeIfPresent(String.self, forKey: .quotation_id)
        is_accept = try values.decodeIfPresent(String.self, forKey: .is_accept)
       
        do{
            date_order = try values.decodeIfPresent(String.self, forKey: .date_order)
        }
        catch{
            date_order = String(describing: try values.decodeIfPresent(Int.self, forKey: .date_order)!)
        }
        is_deliver = try values.decodeIfPresent(String.self, forKey: .is_deliver)
        date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        hrs = try values.decodeIfPresent(String.self, forKey: .hrs)
        mins = try values.decodeIfPresent(String.self, forKey: .mins)
        rating = try values.decodeIfPresent(String.self, forKey: .rating)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        address = try values.decodeIfPresent(OrderDetailAddress.self, forKey: .address)
        customer_lat = try values.decodeIfPresent(Double.self, forKey: .customer_lat)
        customer_lng = try values.decodeIfPresent(Double.self, forKey: .customer_lng)
        company_pic = try values.decodeIfPresent(String.self, forKey: .company_pic)
        business_card_pic = try values.decodeIfPresent(String.self, forKey: .business_card_pic)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        arr_product_detail = try values.decodeIfPresent([Arr_product_detail].self, forKey: .arr_product_detail)
        product_detail = try values.decodeIfPresent(String.self, forKey: .product_detail)
        is_package = try values.decodeIfPresent(String.self, forKey: .is_package)
        distance = try values.decodeIfPresent(String.self, forKey: .distance)
    }
    
}
