/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct OfferData : Codable {
	var offer_title : String?
	var offer_image : String?
	var slo_id : String?

	enum CodingKeys: String, CodingKey {

		case offer_title = "offer_title"
		case offer_image = "offer_image"
		case slo_id = "slo_id"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> OfferData{
        
        var obj = OfferData()
        obj.offer_title = json[CodingKeys.offer_title.rawValue] as? String
        obj.offer_image = json[CodingKeys.offer_image.rawValue] as? String
        obj.slo_id = json[CodingKeys.slo_id.rawValue] as? String
        
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		offer_title = try values.decodeIfPresent(String.self, forKey: .offer_title)
		offer_image = try values.decodeIfPresent(String.self, forKey: .offer_image)
		slo_id = try values.decodeIfPresent(String.self, forKey: .slo_id)
	}

}
