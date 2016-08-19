//  NRConnection.swift
//  DataServiceResponse
//
//  Created by Naveen Rana on 18/08/16.
//  Copyright © 2016 Naveen Rana. All rights reserved.
//
//

import Foundation

///This is used to check web service response type for any NRConnection request to server.

public enum DataServiceResponse {
    
    /**
     Sucess and failure cases.
     
     - Sucess: Get the response successfully for request.
     - Error: If request fails.
     - ServerFail: Exception occurs if server fail with description
     - Unknown: An unknown error occurs.
     */
    
    case Success
    case Error
    case ServerFail(String?)   // this shouldn't really happen, but...
    case Unknown(String?)
    
    
    /**
     Call this method to know if request is success or not.
     

     - Returns: A bool if request is successful or not.
     */

    public func successful() -> Bool {
        switch self {
        case .Success:
            return true
        default:
            return false
        }

    }
    
}