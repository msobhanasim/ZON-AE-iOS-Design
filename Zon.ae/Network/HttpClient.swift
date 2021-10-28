//
//  HTTPClient.swift
//  AUX
//
//  Created by Sobhan Asim on 29/04/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias HttpClientSuccess = (AnyObject?) -> ()
typealias HttpClientFailure = (NSError) -> ()

class HTTPClient {
    
    func postRequestWithJsonString(withEndPoint url : String  , withBody body : [String:Any] , apiMethod : HTTPMethod , success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure )  {
        let token = UserDefaults.standard.string(forKey: "user")
        print(token!)
        var headers: HTTPHeaders{
            if(DataManager.sharedInstance.user != nil){
                
                return ["Authorization": "bearer \(DataManager.sharedInstance.getPermanentlySavedUser()?.access_token ?? "")",
                        "Accept": "application/json"]
            }else{
                return ["Accept": "application/json"]
            }
        }
        print(headers)
        print(body)
        let apiURL = APIConstants.BasePath + url
        print(apiURL)
        DispatchQueue.global(qos: .background).async {
            Alamofire.request(apiURL, method: apiMethod, parameters: body, encoding: URLEncoding.default , headers: headers).responseString { (response:DataResponse<String>) in
                DispatchQueue.main.async {
                    switch(response.result) {
                    case .success(_):
                        if let data = response.result.value{
                            success(data.parseJSONString as AnyObject?)
                        }
                    case .failure(_):
                        failure(response.result.error! as NSError)
                        
                    }
                }
            }
        }
    }
    
    func postRequest(withApi api : API  , success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure ) {
        //let token = UserDefaults.standard.string(forKey: "user")
        //print(token!)
        let params = api.parameters
        let method = api.method
        
        var headers: HTTPHeaders{
            
            if(DataManager.sharedInstance.user != nil){
                return ["Authorization": "Bearer \(DataManager.sharedInstance.getPermanentlySavedUser()?.access_token ?? "")",
                        "Accept": "application/json"]
                
            }else{
                return ["Accept": "application/json"]
            }
        }
        
        print(headers)
        print(api.url())
        //
        print(params ?? "")
        
        DispatchQueue.global(qos: .background).async {
            Alamofire.request(api.url(), method: method,parameters: params, encoding: URLEncoding.default , headers: headers).responseString { (response:DataResponse<String>) in
                DispatchQueue.main.async {
                    switch(response.result) {
                    case .success(_):
                        if let data = response.result.value{
                            success(data.parseJSONString as AnyObject?)
                        }
                    case .failure(_):
                        failure(response.result.error! as NSError)
                        
                    }
                }
                
            }
        }
        
    }
    
    func postRequestWithDataUploading(withApi api : API, success : @escaping HttpClientSuccess, failure: @escaping HttpClientFailure) {
        let url = "http://google.com" /* your API url */
        let headers: HTTPHeaders = [
            "app_key": "iSEiYCaYkcESApgMAqBQciBpP5qI2HB2Y+iocYesMaI=",
            "Accept": "application/json",
            "Connection": "Keep-Alive",
            "Content-type": "multipart/form-data"
        ]
        print(headers )
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in api.parameters! {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            multipartFormData.append("hcduhfuf897985436&cbdhudbubev7eb".data(using: String.Encoding.utf8)!, withName: "apiSeceret")
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                    // NOTIFICATION - UPLOAD PROGRESS
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UploadProgress"), object: nil, userInfo: ["progress": Progress.fractionCompleted])
                    
                })
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UploadComplete"), object: nil, userInfo: nil)
                    
                    if response.error != nil{
                        failure(response.result.error! as NSError)
                        return
                    }
                    success(nil)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                failure(error as NSError)
            }
        }
        
    }
    
    func UploadFiles(withApi api:API,image:UIImage, videoURL: String = "" ,success : @escaping HttpClientSuccess, failure: @escaping HttpClientFailure) {
        
        var headers: HTTPHeaders{
            if(DataManager.sharedInstance.user != nil){
                
                return ["Authorization": "Bearer \(DataManager.sharedInstance.getPermanentlySavedUser()?.access_token ?? "")",
                        "Accept": "application/json"]
            }else{
                return ["Accept": "application/json"]
            }
        }
        
        print(api.url())
        print(api.parameters as Any)
        print(headers)
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            if videoURL == ""{
                let dt = image.compressedData()!
                
                
                if api.url().contains("add-profile-photo"){
                    multipartFormData.append( dt, withName: "profile_picture", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                } else{
                    multipartFormData.append( dt, withName: "image", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                    
                }
                
            }else{
                let video = URL(string: videoURL)
                multipartFormData.append(video!, withName: "file", fileName: String(Date().timeIntervalSince1970)+"." + video!.pathExtension, mimeType:  "video/mp4")
            }
            if api.parameters != nil {
                for (key, value) in api.parameters!{
                    let stringValue = value as? String ?? ""
                    multipartFormData.append(stringValue.data(using: String.Encoding.utf8)!, withName: key)
                }
            }
        }, usingThreshold: UInt64.init(), to: api.url(), method: .post,headers: headers
        ) { (result) in
            switch result{
            case .success(let upload, _,_ ):
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UploadProgress"), object: nil, userInfo: ["progress": Progress.fractionCompleted])
                    
                })
                upload.responseString(completionHandler: { (response:DataResponse<String>)  in
                    switch(response.result) {
                    case .success(_):
                        if let data = response.result.value{
                            success(data.parseJSONString as AnyObject?)
                        }
                    case .failure(_):
                        failure(response.result.error! as NSError)
                    }
                })
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                failure(error as NSError)
            }
        }
    }
    
    func UploadMultipleImages(withApi api:API, images:[UIImage], or dict: [String: UIImage] = [:] , success : @escaping HttpClientSuccess, failure: @escaping HttpClientFailure) {
        
        var headers: HTTPHeaders{
            return ["Authorization": "Bearer \(DataManager.sharedInstance.getAccessTokenPermanentally())",
                    "Accept": "application/json", "Content-type": "multipart/form-data", "Connection": "Keep-Alive"]
        }
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            if images.count > 0 {
                for image in images {
                    let imageData = image.compressedData()
                    multipartFormData.append(imageData ?? Data(), withName: "images[]", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                    
                }
            }else{
                if api.url().contains("add_professional_detail"){
                    
                    for (name, img) in dict {
                        print(name, " ", img)
                        let innerImageData = img.compressedData()
                        
                        if name.contains("photo_1"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "photo_id", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        } else if name.contains("photo_2"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "photo_license", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }else if name.contains("photo_3"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "photo_license_board", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }
                    }
                    
                }else if api.url().contains("add_update_service"){
                    
                    for (name, img) in dict {
                        print(name, " ", img)
                        let innerImageData = img.compressedData()
                        
                        if name.contains("service_other_1"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_1", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        } else if name.contains("service_other_2"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_2", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }else if name.contains("service_other_3"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_3", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }else if name.contains("service_other_4"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_4", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        } else if name.contains("service_other_5"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_5", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }else if name.contains("service_other_6"){
                            multipartFormData.append(innerImageData ?? Data(), withName: "service_other_6", fileName: String(Date().timeIntervalSince1970) + ".png", mimeType: "image/png")
                        }
                    }
                }
                
            }
            
            
            if api.parameters != nil {
                var stringValue = ""
                for (key, value) in api.parameters!{
                    if let intValue = value as? Int {
                        stringValue = String(intValue)
                    } else {
                        stringValue = value as? String ?? ""
                    }
                    multipartFormData.append(stringValue.data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            
        }, to: api.url(), headers: headers,
        
        encodingCompletion: { encodingResult in
            
            switch encodingResult{
            case .success(let upload, _, _ ):
                
                print(upload)
                print(encodingResult)
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UploadProgress"), object: nil, userInfo: ["progress": Progress.fractionCompleted])
                    
                })
                upload.responseString(completionHandler: { (response:DataResponse<String>)  in
                    switch(response.result) {
                    case .success(_):
                        if let data = response.result.value{
                            success(data.parseJSONString as AnyObject?)
                        }
                    case .failure(_):
                        failure(response.result.error! as NSError)
                    }
                })
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                failure(error as NSError)
            }
            
        })
        
        
    }
    
}

extension HTTPClient{
    
    class func upload(images:[String], text: String, commId: String){
        var semaphore = DispatchSemaphore (value: 0)
        
        var params: [[String : Any]] = []
        
        let a = [
            "key": "community_id",
            "value": "\(commId)",
            "type": "text"
        ]
        
        let b = [
            "key": "message",
            "value": "\(text)",
            "type": "text"
        ]
        
        params.append(a)
        params.append(b)
        var i = 0
        for imgUrl in images{
            
            var fileType = "png"
            
            if imgUrl.contains("JPG"){
                fileType = "jpg"
            }else if imgUrl.contains("JPEG"){
                fileType = "jpeg"
            }else if imgUrl.contains("PNG"){
                fileType = "png"
            }else{
                fileType = imgUrl.split(separator: ".").last?.lowercased() ?? "pngs"
            }
            let tempParam = [
                "key": "images[\(i)]",
                "src": imgUrl,
                "type": fileType
            ]
            i += 1
            
            params.append(tempParam)
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in params {
            if param["disabled"] == nil {
                let paramName = param["key"]!
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(paramName)\""
                if param["contentType"] != nil {
                    body += "\r\nContent-Type: \(param["contentType"] as! String)"
                }
                let paramType = param["type"] as! String
                if paramType == "text" {
                    let paramValue = param["value"] as! String
                    body += "\r\n\r\n\(paramValue)\r\n"
                } else {
                    let paramSrc = param["src"] as! String
                    
                    do {
                        let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
                        let fileContent = String(data: fileData, encoding: .utf8)!
                        body += "; filename=\"\(paramSrc)\"\r\n"
                            + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                    }
                    catch{
                        print(error)
                    }
                    
                    
                }
            }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://139.162.3.157/a2i-phase2/api/send_community_message")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDE4YjEyOWYyZmM1MTFmYTM2YmUxNzhiODUzZjRmMGI5ZTQ1NzY1ZGE0MzlhMGUwZGMxMzhhNTA1NTY4YmY2OWJlNzM2OTAxZTFlMDFkYTkiLCJpYXQiOjE2MTE1NjUyMDEsIm5iZiI6MTYxMTU2NTIwMSwiZXhwIjoxNjQzMTAxMjAxLCJzdWIiOiIzMDQiLCJzY29wZXMiOltdfQ.H4rMf-XhkjQdRU87ye_eyMifNYdC4L1g0BQbMBYI_nSqcehcB7XlEmSubElZ5rYPm2OheeAaTH2T2rmaPjJ67abcf0H0s6iZcLPfq2EWTgd_LeZWxa6OhceQLBS70vgxikX9xM4f1lLJYNMsCMkxDUF1BASATiUm4avvMOZIyjrCv7BRs_IugYTAmyaLti5tOXaXDT5HJ1uLMc2cgolKAbTSir47tg_Rs6r6jiCdRAX-zhDP48ZUSwe7vxAF8p8AbxN2cdo2EFHDwlENcxBtjH73wQUJADrtKQuXvQJNufD_a-BMgixOaEZW75u6WORMzDzoz9HSo_pkGSRksS6blAx-rwS-6h0w8LXYqbIHqauHlPPdLBnkjTVShdFrmSwUJ6pUHghyZ172-AH6kaTJ5Irg4N4l9Cb74cSHfq8sNfuy0MDVp2TFbO_Z3vVyz_gT_bDpdT_W4BRcU3hLZ4_oSNw_B9aO-0DElsiqOJ3wt2nA05BxbwZBMJkHL5-QyXRrWNBaWhywf3xxZmaq6Dz27D0s-Aw9rf4WlEWTTwCy4Bu8krrCOQZMcU3aNI2mo8kB0FKu7LIDHqE3JiPM2uNf2bJtO6_gzTQFZPEAJdAAV2xg7rJAWNfHpITCwiLahY2SXWCCPJnmU06hbgDS5tCUnlgU3YNGj1MyReD8BLFCt1o", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
}
