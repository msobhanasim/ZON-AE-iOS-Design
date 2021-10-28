/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AreaCategory : Codable {
    
	var cat_id : String?
	var cat_name_en : String?
    
    
    
    var isSelected = false
    var radius = ""
    var isParentSelected = false
    var category : String?
    var label : String?
    var cat_id_Int : Int?
    
	enum CodingKeys: String, CodingKey {

		case cat_id = "cat_id"
		case cat_name_en = "cat_name_en"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> AreaCategory{
        
        var obj = AreaCategory()
        
        obj.cat_id = json[CodingKeys.cat_id.rawValue] as? String
        obj.cat_name_en = json[CodingKeys.cat_name_en.rawValue] as? String
        
        return obj
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cat_id = try values.decodeIfPresent(String.self, forKey: .cat_id)
		cat_name_en = try values.decodeIfPresent(String.self, forKey: .cat_name_en)
	}

}
