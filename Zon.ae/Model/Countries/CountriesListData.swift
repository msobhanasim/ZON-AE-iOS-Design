/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CountriesListData : Codable {
	var id : Int?
	var name : String?
	var code : String?
	var flag : String?
	var currency : String?
	var currency_symbol : String?
	var calling_code : String?
	var languages : [CountriesListLanguages]?

	enum CodingKeys: String, CodingKey {

		case id                 = "id"
		case name               = "name"
		case code               = "code"
		case flag               = "flag"
		case currency           = "currency"
		case currency_symbol    = "currency_symbol"
		case calling_code       = "calling_code"
		case languages          = "languages"
	}
    
    init(){ }

    static func initFrom(json:[String:Any]) -> CountriesListData{
        
        var obj = CountriesListData()
        
        obj.id = json[CodingKeys.id.rawValue] as? Int
        obj.name = json[CodingKeys.name.rawValue] as? String
        obj.code = json[CodingKeys.code.rawValue] as? String
        obj.flag = json[CodingKeys.flag.rawValue] as? String
        obj.currency = json[CodingKeys.currency.rawValue] as? String
        obj.currency_symbol = json[CodingKeys.currency_symbol.rawValue] as? String
        obj.calling_code = json[CodingKeys.calling_code.rawValue] as? String
        
        if let langArr = json[CodingKeys.languages.rawValue] as? [[String: Any]] {
            obj.languages?.removeAll()
            for language in langArr {
                let languageData = CountriesListLanguages.initFrom(json: language)
                obj.languages?.append(languageData)
            }
        }
        
        return obj
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		flag = try values.decodeIfPresent(String.self, forKey: .flag)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		currency_symbol = try values.decodeIfPresent(String.self, forKey: .currency_symbol)
		calling_code = try values.decodeIfPresent(String.self, forKey: .calling_code)
		languages = try values.decodeIfPresent([CountriesListLanguages].self, forKey: .languages)
	}

}
