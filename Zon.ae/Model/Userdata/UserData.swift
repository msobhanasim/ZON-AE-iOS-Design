/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct UserData : Codable {
	var token : String?
	var is_profile : String?
	var flag : Int?
	var is_verify : String?
	var name : String?
	var email : String?
	var status : String?
	var phone_no : String?
    var have_address : Int?
    
	enum CodingKeys: String, CodingKey {

		case token = "token"
		case is_profile = "is_profile"
		case flag = "flag"
		case is_verify = "is_verify"
		case name = "name"
		case email = "email"
		case status = "status"
		case phone_no = "phone_no"
        case have_address = "have_address"
	}
    
    init(){}
    
    static func initFrom(json:[String:Any]) -> UserData{
        var obj = UserData()
        obj.token = json[CodingKeys.token.rawValue] as? String
        obj.is_profile = json[CodingKeys.is_profile.rawValue] as? String
        obj.flag = json[CodingKeys.flag.rawValue] as? Int
        obj.is_verify = json[CodingKeys.is_verify.rawValue] as? String
        obj.name = json[CodingKeys.name.rawValue] as? String
        obj.email = json[CodingKeys.email.rawValue] as? String
        obj.status = json[CodingKeys.status.rawValue] as? String
        obj.phone_no = json[CodingKeys.phone_no.rawValue] as? String
        obj.have_address = json[CodingKeys.have_address.rawValue] as? Int
        return obj
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		is_profile = try values.decodeIfPresent(String.self, forKey: .is_profile)
		flag = try values.decodeIfPresent(Int.self, forKey: .flag)
		is_verify = try values.decodeIfPresent(String.self, forKey: .is_verify)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
        have_address = try values.decodeIfPresent(Int.self, forKey: .have_address)

	}

}
