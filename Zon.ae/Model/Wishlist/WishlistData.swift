/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WishlistData : Codable {
	var lable : String?
	var title : String?
	var detail : String?
	var price : String?
	var image : String?
	var od_id : String?
	var lat : Double?
	var lng : Double?
	var arr_product_detail : [Arr_product_detail]?

	enum CodingKeys: String, CodingKey {

		case lable = "lable"
		case title = "title"
		case detail = "detail"
		case price = "price"
		case image = "image"
		case od_id = "od_id"
		case lat = "lat"
		case lng = "lng"
		case arr_product_detail = "arr_product_detail"
	}
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> WishlistData{
        var obj = WishlistData()
        obj.lable = json[CodingKeys.lable.rawValue] as? String
        obj.title = json[CodingKeys.title.rawValue] as? String
        obj.detail = json[CodingKeys.detail.rawValue] as? String
        obj.price = json[CodingKeys.price.rawValue] as? String
        obj.image = json[CodingKeys.image.rawValue] as? String
        obj.od_id = json[CodingKeys.od_id.rawValue] as? String
        obj.lat = json[CodingKeys.lat.rawValue] as? Double
        obj.lng = json[CodingKeys.lng.rawValue] as? Double
        
        if let productDetails = json[CodingKeys.arr_product_detail.rawValue] as? [[String:Any]]{
            obj.arr_product_detail?.removeAll()
            for singleProductDetail in productDetails {
                let detail = Arr_product_detail.initFrom(json: singleProductDetail)
                obj.arr_product_detail?.append(detail)
            }
        }
        
        return obj
    }


	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lable = try values.decodeIfPresent(String.self, forKey: .lable)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		detail = try values.decodeIfPresent(String.self, forKey: .detail)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		od_id = try values.decodeIfPresent(String.self, forKey: .od_id)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		arr_product_detail = try values.decodeIfPresent([Arr_product_detail].self, forKey: .arr_product_detail)
	}

}
