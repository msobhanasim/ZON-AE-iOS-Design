
//
//  APIManager.swift
//  AUX
//
//  Created by Sobhan Asim on 29/04/2021.
//

import Foundation
import SwiftyJSON

typealias APICompletion = (APIResponse) -> ()

class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    private lazy var httpClient : HTTPClient = HTTPClient()
    
    func opertationWithRequest ( withApi api : API , completion : @escaping APICompletion) {
        httpClient.postRequest(withApi: api, success: { (data) in
            guard let response = data else {
                completion(APIResponse.Failure(""))
                return
            }
            let json = JSON(response)
            print("Json,API : \(json),\(api.url())")
            if let errorCode = json.dictionaryValue["status"]?.int {
                if errorCode == 404 {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        if message == "Session Expired"{
                            //Logout functionality
                            return
                        }
                        completion(APIResponse.Failure(message))
                        return
                    }
                    completion(APIResponse.Failure(""))
                    return
                }else if (errorCode == 400) {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        completion(APIResponse.Failure(message))
                        return
                    }
                }else if let status = json.dictionaryValue["status"]?.bool  {
                    if (!status) {
                        if let message = json.dictionaryValue["message"]?.stringValue {
                            if message == "Session Expired" {
                                //Logout functionality
                                
                            }else {
                                completion(APIResponse.Failure(message))
                            }
                            return
                        }
                    }
                }else{
                    if let email = json.dictionaryValue["message"]?["email"][0].stringValue {
                        if !email.isEmpty{
                            completion(APIResponse.Failure(email))
                            return
                        }
                    }
                    if let password = json.dictionaryValue["message"]?["password"][0].stringValue {
                        
                        if !password.isEmpty{
                            completion(APIResponse.Failure(password))
                            return
                        }
                    }
                }
            }else if let status = json.dictionaryValue["status"]?.stringValue {
                if (status == "error") {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        if message == "Session Expired" {
                            //Logout functionality
                            
                        }else {
                            completion(APIResponse.Failure(message))
                        }
                        
                        return
                    }
                }
            }
            
            if json.stringValue.contains("\"status\":\"error\""){
                completion(APIResponse.Failure(""))
                return
            }
            completion(.Success(api.handleResponse(parameters: json)))
            
        }) { (error) in
            print(error)
            completion(APIResponse.Failure(error.localizedDescription))
        }
    }
    
    func jsonDecoder<T : Decodable>(structure: T.Type,jsonData: APIResponse) -> Any{
        let responseData = try? JSONSerialization.data(withJSONObject: jsonData, options: [])
        print(jsonData)
        let jsonDecoder = JSONDecoder()
        let data = try? jsonDecoder.decode(structure.self, from: responseData!)
        return data!
    }
    
    func opertationWithRequestWithFileUploading ( withApi api : API, image:UIImage , videoURL: String = "", completion : @escaping APICompletion ) {
        
        httpClient.UploadFiles(withApi: api,image:image, videoURL: videoURL, success: { (data) in
            guard let response = data else {
                completion(APIResponse.Failure(""))
                return
            }
            let json = JSON(response)
            if let errorCode = json.dictionaryValue["status"]?.int {
                if errorCode == 404 {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        if message == "Session Expired"{
                            //Logout functionality
                            return
                        }
                        
                        completion(APIResponse.Failure(message))
                        return
                    }
                    completion(APIResponse.Failure(""))
                    return
                }else if (errorCode == 400) {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        completion(APIResponse.Failure(message))
                        return
                    }
                }else if let status = json.dictionaryValue["status"]?.bool  {
                    if (!status) {
                        if let message = json.dictionaryValue["message"]?.stringValue {
                            if message == "Session Expired" {
                                //Logout functionality
                                
                            }else {
                                completion(APIResponse.Failure(message))
                            }
                            return
                        }
                    }
                }else{
                    if let email = json.dictionaryValue["message"]?["email"][0].stringValue {
                        if !email.isEmpty{
                            completion(APIResponse.Failure(email))
                            return
                        }
                    }
                    if let password = json.dictionaryValue["message"]?["password"][0].stringValue {
                        
                        if !password.isEmpty{
                            completion(APIResponse.Failure(password))
                            return
                        }
                        
                        
                    }
                }
            }else if let status = json.dictionaryValue["status"]?.bool {
                if (status) {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        completion(APIResponse.Failure(message))
                        return
                    }
                }
            }
            
            if json.stringValue.contains("\"status\":\"error\""){
                completion(APIResponse.Failure(""))
                return
            }
            completion(.Success(api.handleResponse(parameters: json)))
            
        }) { (error) in
            print(error)
            completion(APIResponse.Failure(error.localizedDescription))
        }
    }
    
    
    //    Video Uploading Func Implementation
    
    
    func opertationWithRequestWithVideoUploading ( withApi api : API, videoURL: String = "", completion : @escaping APICompletion ) {
        
        httpClient.UploadFiles(withApi: api, image: UIImage(), videoURL: videoURL, success: { (data) in
            guard let response = data else {
                completion(APIResponse.Failure(""))
                return
            }
            let json = JSON(response)
            if let errorCode = json.dictionaryValue["status"]?.int {
                if errorCode == 404 {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        if message == "Session Expired"{
                            //Logout functionality
                            return
                        }
                        
                        completion(APIResponse.Failure(message))
                        return
                    }
                    completion(APIResponse.Failure(""))
                    return
                }else if (errorCode == 400) {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        completion(APIResponse.Failure(message))
                        return
                    }
                }else if let status = json.dictionaryValue["status"]?.bool  {
                    if (!status) {
                        if let message = json.dictionaryValue["message"]?.stringValue {
                            if message == "Session Expired" {
                                //Logout functionality
                                
                            }else {
                                completion(APIResponse.Failure(message))
                            }
                            return
                        }
                    }
                }else{
                    if let email = json.dictionaryValue["message"]?["email"][0].stringValue {
                        if !email.isEmpty{
                            completion(APIResponse.Failure(email))
                            return
                        }
                    }
                    if let password = json.dictionaryValue["message"]?["password"][0].stringValue {
                        
                        if !password.isEmpty{
                            completion(APIResponse.Failure(password))
                            return
                        }
                        
                        
                    }
                }
            }else if let status = json.dictionaryValue["status"]?.bool {
                if (status) {
                    if let message = json.dictionaryValue["message"]?.stringValue {
                        completion(APIResponse.Failure(message))
                        return
                    }
                }
            }
            
            if json.stringValue.contains("\"status\":\"error\""){
                completion(APIResponse.Failure(""))
                return
            }
            completion(.Success(api.handleResponse(parameters: json)))
            
        }) { (error) in
            print(error)
            completion(APIResponse.Failure(error.localizedDescription))
        }
    }
    
    func opertationWithRequestWithMultipleImagesFileUploading(withApi api : API, image:[UIImage] , or dict: [String: UIImage] = [:],  completion : @escaping APICompletion )  {
        print("Json,API :\(api.url())")
        print("Json,API :\(api.parameters ?? Dictionary.init())")
        dump(image)
        httpClient.UploadMultipleImages(withApi: api, images: image, or: dict, success: { (data) in
            guard let response = data else {
                completion(APIResponse.Failure(""))
                return
            }
            let json = JSON(response)
            print("Json,API :\(api.url())")
            print("Json,API :\(api.parameters ?? Dictionary.init())")
            
            
            if let errorCode = json.dictionaryValue["status"]?.int {
                if  errorCode == 400 {
                    if let message = json.dictionaryValue["errorMessage"]?.stringValue {
                        
                        if message == "Session Expired"{
                            return
                        }
                        
                        completion(APIResponse.Failure(message))
                        return
                    }
                    completion(APIResponse.Failure(""))
                    return
                }
                if errorCode == 401{
                    
                    //User Session Has been expired
                }
            }
            
            completion(.Success(api.handleResponse(parameters: json)))
            
        }) { (error) in
            print(error)
            completion(APIResponse.Failure(error.localizedDescription))
        }
        
        
    }
    
 
}






