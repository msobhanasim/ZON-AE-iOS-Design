/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ImageData : Codable {
	var mid : String?
	var name : String?
	var score : Double?
	var boundingPoly : BoundingPoly?

	enum CodingKeys: String, CodingKey {

		case mid = "mid"
		case name = "name"
		case score = "score"
		case boundingPoly = "boundingPoly"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> ImageData{
        
        var obj = ImageData()
        obj.mid = json[CodingKeys.mid.rawValue] as? String
        obj.name = json[CodingKeys.name.rawValue] as? String
        obj.score = json[CodingKeys.score.rawValue] as? Double
        obj.boundingPoly = BoundingPoly.initFrom(json: json[CodingKeys.boundingPoly.rawValue] as? [String: Any] ?? [:])
       
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mid = try values.decodeIfPresent(String.self, forKey: .mid)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
		boundingPoly = try values.decodeIfPresent(BoundingPoly.self, forKey: .boundingPoly)
	}

}
