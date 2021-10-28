/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OfferDetailIArray : Codable {
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
	var images : String?
	var image_count : String?
	var product_name : String?
	var product_id : String?
	var customer_image : String?
	var quotation_images : String?
	var seller_name : String?
	var full_address : String?
	var phone_no : String?
	var trade_license_nr : String?
	var seller_id : String?
	var vat : String?
	var delivery_fee : String?
	var quantity : String?
	var order_id : String?
	var lable : String?
	var customer_lat : Double?
	var customer_lng : Double?
	var od_id : String?
	var lat : Double?
	var lng : Double?
	var address_id : String?

	enum CodingKeys: String, CodingKey {

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
		case images = "images"
		case image_count = "image_count"
		case product_name = "product_name"
		case product_id = "product_id"
		case customer_image = "customer_image"
		case quotation_images = "quotation_images"
		case seller_name = "seller_name"
		case full_address = "full_address"
		case phone_no = "phone_no"
		case trade_license_nr = "trade_license_nr"
		case seller_id = "seller_id"
		case vat = "vat"
		case delivery_fee = "delivery_fee"
		case quantity = "quantity"
		case order_id = "order_id"
		case lable = "lable"
		case customer_lat = "customer_lat"
		case customer_lng = "customer_lng"
		case od_id = "od_id"
		case lat = "lat"
		case lng = "lng"
		case address_id = "address_id"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> OfferDetailIArray{
        
        var obj = OfferDetailIArray()
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
        obj.images = json[CodingKeys.images.rawValue] as? String
        obj.image_count = json[CodingKeys.image_count.rawValue] as? String
        obj.product_name = json[CodingKeys.product_name.rawValue] as? String
        obj.product_id = json[CodingKeys.product_id.rawValue] as? String
        obj.customer_image = json[CodingKeys.customer_image.rawValue] as? String
        obj.quotation_images = json[CodingKeys.quotation_images.rawValue] as? String
        obj.seller_name = json[CodingKeys.seller_name.rawValue] as? String
        obj.full_address = json[CodingKeys.full_address.rawValue] as? String
        obj.phone_no = json[CodingKeys.phone_no.rawValue] as? String
        obj.trade_license_nr = json[CodingKeys.trade_license_nr.rawValue] as? String
        obj.seller_id = json[CodingKeys.seller_id.rawValue] as? String
        obj.vat = json[CodingKeys.vat.rawValue] as? String
        obj.delivery_fee = json[CodingKeys.delivery_fee.rawValue] as? String
        obj.quantity = json[CodingKeys.quantity.rawValue] as? String
        obj.order_id = json[CodingKeys.order_id.rawValue] as? String
        obj.lable = json[CodingKeys.lable.rawValue] as? String
        obj.customer_lat = json[CodingKeys.customer_lat.rawValue] as? Double
        obj.customer_lng = json[CodingKeys.customer_lng.rawValue] as? Double
        obj.od_id = json[CodingKeys.od_id.rawValue] as? String
        obj.lat = json[CodingKeys.lat.rawValue] as? Double
        obj.lng = json[CodingKeys.lng.rawValue] as? Double
        obj.address_id = json[CodingKeys.address_id.rawValue] as? String
        
        return obj
    }
    

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		is_image_request = try values.decodeIfPresent(String.self, forKey: .is_image_request)
		order_quantity = try values.decodeIfPresent(String.self, forKey: .order_quantity)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		quotation_id = try values.decodeIfPresent(String.self, forKey: .quotation_id)
		is_accept = try values.decodeIfPresent(String.self, forKey: .is_accept)
		date_order = try values.decodeIfPresent(String.self, forKey: .date_order)
		is_deliver = try values.decodeIfPresent(String.self, forKey: .is_deliver)
		date_deliver = try values.decodeIfPresent(String.self, forKey: .date_deliver)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
		hrs = try values.decodeIfPresent(String.self, forKey: .hrs)
		mins = try values.decodeIfPresent(String.self, forKey: .mins)
		images = try values.decodeIfPresent(String.self, forKey: .images)
		image_count = try values.decodeIfPresent(String.self, forKey: .image_count)
		product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
		product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
		customer_image = try values.decodeIfPresent(String.self, forKey: .customer_image)
		quotation_images = try values.decodeIfPresent(String.self, forKey: .quotation_images)
		seller_name = try values.decodeIfPresent(String.self, forKey: .seller_name)
		full_address = try values.decodeIfPresent(String.self, forKey: .full_address)
		phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
		trade_license_nr = try values.decodeIfPresent(String.self, forKey: .trade_license_nr)
		seller_id = try values.decodeIfPresent(String.self, forKey: .seller_id)
		vat = try values.decodeIfPresent(String.self, forKey: .vat)
		delivery_fee = try values.decodeIfPresent(String.self, forKey: .delivery_fee)
		quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
		order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
		lable = try values.decodeIfPresent(String.self, forKey: .lable)
		customer_lat = try values.decodeIfPresent(Double.self, forKey: .customer_lat)
		customer_lng = try values.decodeIfPresent(Double.self, forKey: .customer_lng)
		od_id = try values.decodeIfPresent(String.self, forKey: .od_id)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		address_id = try values.decodeIfPresent(String.self, forKey: .address_id)
	}

}
