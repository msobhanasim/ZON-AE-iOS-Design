//
//  ForgotPassInfo.swift
//  ZON
//
//  Created by Apple PC on 26/06/2020.
// 
//

import Foundation
struct ForgotPassInfo : Codable {
    
    let message : String?
    let code : Int?
    let data : String?
    let success : SuccessData?

//    let is_profile : Bool?
    enum CodingKeys: String, CodingKey {
        
        case message = "message"
        case code = "code"
        case data = "data"
        case success = "success"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        success = try values.decodeIfPresent(SuccessData.self, forKey: .success)

//        is_profile = try values.decodeIfPresent(Bool.self, forKey: .is_profile)

    }
    
    
    
  
    
    
}
struct SuccessData : Codable {
let code : Int?
    enum CodingKeys: String, CodingKey {
            
            
            case code = "code"
       
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
     
            code = try values.decodeIfPresent(Int.self, forKey: .code)
      

        }
}
