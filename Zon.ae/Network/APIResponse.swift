
//
//  API.swift
//  AUX
//
//  Created by Sobhan Asim on 29/04/2021.
//

import Foundation
import SwiftyJSON
import ObjectMapper

extension API{
    
    

    func handleResponse(parameters : JSON?) -> AnyObject? {
        switch self {

        // MARK: Auth Module API Responses
        
        case .login:
            
            let message = parameters?.dictionary?["message"]?.rawValue as! String
            
            let user = User().initUserFrom(json: parameters?.dictionary?["data"]?["user"].dictionaryObject ?? [:])
            user.access_token = parameters?.dictionary?["data"]?["access_token"].string
            
            DataManager.sharedInstance.user_created_playlists = parameters?.dictionary?["data"]?["createdParties"].int ?? 0
            DataManager.sharedInstance.user_joined_playlists = parameters?.dictionary?["data"]?["joinedParties"].int ?? 0
            
            DataManager.sharedInstance.saveAccessTokenPermanentally(parameters?.dictionary?["data"]?["access_token"].string ?? "")
            
            DataManager.sharedInstance.user = user
            DataManager.sharedInstance.saveUserPermanentally(user)
            
            if (message.lowercased().contains("successful")){
                DataManager.sharedInstance.loggedIn = true
        
                return true as AnyObject
                
            }else if message == "Verify Your Account First"{
                DataManager.sharedInstance.loggedIn = false
                return parameters?.dictionary?["data"]?.dictionaryObject as AnyObject
                
            }else{
                DataManager.sharedInstance.loggedIn = false
                return false as AnyObject
                
            }
            
        
            
//        case .getGenre:
//            let status = parameters?.dictionary?["status"]?.rawValue as? Bool ?? false
//            if (status){
//                return parameters?.dictionary?["data"]?.rawValue as AnyObject
//            }else{
//                return false as AnyObject
//            }
        
        
        // MARK: Home APIs
        
        case .getHomeData:
            return [:]
            
        }
    }
}


enum APIValidation : String{
    case None
    case Success = "1"
    case ServerIssue = "500"
    case Failed = "0"
    case TokenInvalid = "401"
}

enum APIResponse {
    case Success(AnyObject?)
    case Failure(String?)
}

func decode<T: Decodable>(_ dataJS: JSON?) -> T?{
    if let data = dataJS?.rawString()?.data(using: .utf8){
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            print(error as Any)
            return nil
        }
    }else{
        return nil
    }
}
