//  NRConnection.swift
//  NRConnection
//
//  Created by Naveen Rana on 18/08/16.
//  Copyright © 2016 Naveen Rana. All rights reserved.
//
//

//---------------- This class is used as Network Layer in the the app ---------------------------------------

import Foundation
import Alamofire
import ReachabilitySwift

public var BASE_URL = "https://jsonplaceholder.typicode.com/"

public typealias NRCompletionHander = (response: DataServiceResponse ,result: AnyObject?) -> Void
public class NRConnection {
    
    
   public class func isInternetAvailable() -> Bool {
        
        do{
            let internetReach = try Reachability.reachabilityForInternetConnection()
            internetReach.stopNotifier()
            try internetReach.startNotifier()
            return internetReach.isReachable()
        }
        catch(_){
            //DLOG(Error)
        }
        
        return false
    }
    
    
    public class func callServiceWithName(methodType: Alamofire.Method = .POST,serviceName : String , parameters : Dictionary<String,AnyObject>, completionHandler : NRCompletionHander) {
        
        if !NRConnection.isInternetAvailable() {
            completionHandler(response: .Error , result: nil)
            return
        }
        
        var encoding: ParameterEncoding = .JSON // if you are sending data in json format
        if methodType == .GET {
            encoding = .URL // in case if get web service its is in url format
        }

        
        let baseUrl = BASE_URL.stringByAppendingString("\(serviceName)")
        print("Request for \(baseUrl)/ Parameters \n \(parameters)")
        
        
        Alamofire.request(methodType, baseUrl, parameters: parameters, encoding: encoding, headers: nil).responseJSON { (response) in
            switch response.result {
            case .Success:
                if let _ = response.result.value { //
                    completionHandler(response: .Success , result: response.result.value!)
                    
                }
                else {
                    completionHandler(response: .Error , result: nil)
                    
                }
            case .Failure(let error):
                print(error.description)
                completionHandler(response: .Error , result: nil)
                
            }
        }
        
    }
    
    public class func callServiceWithImagesVideosArray(methodType: Alamofire.Method = .POST ,imagesArray :[UIImage] = [],videoArray: [NSData] = [] , parameters : Dictionary<String,AnyObject>, serviceName: String ,completionHandler : NRCompletionHander) {
    
        if !NRConnection.isInternetAvailable() {
            completionHandler(response: .Error , result: nil)
            return
        }
        
                
        let baseUrl = BASE_URL.stringByAppendingString("\(serviceName)")
        print("Request for \(baseUrl)/ Parameters \n \(parameters)")
        Alamofire.upload(methodType, baseUrl, headers: nil, multipartFormData: { multipartFormData in
            for i in 0..<imagesArray.count // upload images with imagename (image1 , image2 .....)
            {
                let fileName = "image\(i+1).jpg"
                let imageName = "image\(i+1)"
                multipartFormData.appendBodyPart(data: UIImageJPEGRepresentation(imagesArray[i], 0.8)!, name: imageName, fileName: fileName, mimeType: "image/jpeg")
                
            }
            
            for i in 0..<videoArray.count // upload images with imagename (image1 , image2 .....)
            {
                let fileName = "video\(i+1).mp4"
                let videoName = "video\(i+1)"
                multipartFormData.appendBodyPart(data: videoArray[i], name: videoName, fileName: fileName, mimeType: "video/mp4")
                
            }

            do {
                
                for (key, value) in parameters {
                    
                    let keyTemp = String(key)
                    let valueTemp = String(value)
                    let valeData = valueTemp.dataUsingEncoding(NSUTF8StringEncoding)
                    multipartFormData.appendBodyPart(data: valeData!, name: keyTemp)
                    
                }
            }
            
            }) { (encodingResult) in
                switch encodingResult {
                    
                    case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        if let _ = response.data {
                            let dataString = String(data: response.data!, encoding: NSUTF8StringEncoding)
                            print("Response for  \(dataString)/ is  \n \(response.debugDescription)")
                            
                        }
                        if let _ = response.result.value {
                            completionHandler(response: .Success , result: response.result.value!)
                            
                        }
                        else {
                            completionHandler(response: .Error , result: nil)
                            
                        }
                        
                    }
                    case .Failure(let encodingError):
                    print(encodingError)
                    completionHandler(response: .Error , result: nil)
                    
                }
        }
        
        
    }
    
    public class func callServiceWithURL(url: NSURL, completionHandler : NRCompletionHander) {
        
        if !NRConnection.isInternetAvailable() {
            
            return
        }
        
        Alamofire.request(.GET, url, parameters: [:])
            .responseJSON { response in
                
                switch response.result {
                case .Success:
                    if let _ = response.result.value {
                        completionHandler(response: .Success , result: response.result.value!)
                        
                    }
                    else {
                        completionHandler(response: .Error , result: nil)
                        
                    }
                case .Failure(let error):
                    print(error.description)
                    completionHandler(response: .Error , result: nil)
                    
                }
        }
        
    }

}