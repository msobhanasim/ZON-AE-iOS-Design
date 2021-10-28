/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ForceUpdateInfo : Codable {
	var code : Int?
	var ios : String?
	var android : String?
	var is_force : Int?
	var is_live : String?
	var is_comming_soon : String?
	var message : String?
	var app_link : String?
	var play_link : String?

	enum CodingKeys: String, CodingKey {

		case code               = "code"
		case ios                = "ios"
		case android            = "android"
		case is_force           = "is_force"
		case is_live            = "is_live"
		case is_comming_soon    = "is_comming_soon"
		case message            = "message"
		case app_link           = "app_link"
		case play_link          = "play_link"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> ForceUpdateInfo{
        
        var obj = ForceUpdateInfo()
        obj.code = json[CodingKeys.code.rawValue] as? Int
        obj.ios = json[CodingKeys.ios.rawValue] as? String
        obj.android = json[CodingKeys.android.rawValue] as? String
        obj.is_force = json[CodingKeys.is_force.rawValue] as? Int
        obj.is_live = json[CodingKeys.is_live.rawValue] as? String
        obj.is_comming_soon = json[CodingKeys.is_comming_soon.rawValue] as? String
        obj.message = json[CodingKeys.message.rawValue] as? String
        obj.app_link = json[CodingKeys.app_link.rawValue] as? String
        obj.play_link = json[CodingKeys.play_link.rawValue] as? String
        
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		ios = try values.decodeIfPresent(String.self, forKey: .ios)
		android = try values.decodeIfPresent(String.self, forKey: .android)
		is_force = try values.decodeIfPresent(Int.self, forKey: .is_force)
		is_live = try values.decodeIfPresent(String.self, forKey: .is_live)
		is_comming_soon = try values.decodeIfPresent(String.self, forKey: .is_comming_soon)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		app_link = try values.decodeIfPresent(String.self, forKey: .app_link)
		play_link = try values.decodeIfPresent(String.self, forKey: .play_link)
	}

}
