
//
//  APIRoutes.swift
//  AUX
//
//  Created by Sobhan Asim on 29/04/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias OptionalDictionary = [String : Any]?
typealias OptionalSwiftJSONParameters = [String : JSON]?

infix operator =>
infix operator =|
infix operator =<
infix operator =/

func =>(key : String, json : OptionalSwiftJSONParameters) -> String?{
    return json?[key]?.stringValue
}

func =<(key : String, json : OptionalSwiftJSONParameters) -> Double?{
    return json?[key]?.double
}

func =|(key : String, json : OptionalSwiftJSONParameters) -> [JSON]?{
    return json?[key]?.arrayValue
}

func =/(key : String, json : OptionalSwiftJSONParameters) -> Int?{
    return json?[key]?.intValue
}

prefix operator ¿
prefix func ¿(value : String?) -> String {
    return value.unwrap()
}


protocol Router {
    var route : String { get }
    var baseURL : String { get }
    var parameters : OptionalDictionary { get }
    var method : Alamofire.HTTPMethod { get }
}



enum API {
    
    static func mapKeysAndValues(keys : [String]?,values : [String]?) -> [String : String]?{
        guard let tempValues = values,let tempKeys = keys else { return nil}
        var params = [String : String]()
        for (key,value) in zip(tempKeys,tempValues) {
            params[key] = ¿value
        }
        return params
    }
    
    
    
    // MARK: Auth Module API Routes
    
    case login(email: String, password: String)
    
    
    // MARK: Home APIs
    
    case getHomeData
    
}


extension API : Router{
    var baseURL : String {  return APIConstants.BasePath }
    
    var parameters : OptionalDictionary {
        let pm = formatParameters()
        return pm
    }
    
    func url() -> String {
        return baseURL + route
    }
    
    var route : String {
        switch self {
        
        // MARK: Auth Module API Paths
        
        case .login:
            return APIPaths.login
            
        // MARK: Home APIs
        
        case .getHomeData:
            return APIPaths.home
            
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        
        // MARK: Auth Module API Request Methods
        case .login:
            return .post
            
        // MARK: Home APIs
        
        case .getHomeData:
            return .get
            
        }
    }
}

extension API {
    func formatParameters() -> OptionalDictionary {
        switch self {
        
        // MARK: Auth Module API Request Parameters
        
        case .login(email: let email, password: let password):
            return ["email": email,
                    "password": password]
            
        // MARK: Home APIs
        
        case .getHomeData:
            return [:]
            
        }
    }
}
