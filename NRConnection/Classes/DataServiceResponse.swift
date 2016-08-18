//  NRConnection.swift
//  DataServiceResponse
//
//  Created by Naveen Rana on 18/08/16.
//  Copyright © 2016 Naveen Rana. All rights reserved.
//
//
//---------------- This class is used to check Web service response type  in the the app ---------------------------------------

import Foundation

public enum DataServiceResponse {
    
    case Success
    case Error
    case ServerFail(String?)   // this shouldn't really happen, but...
    case MissingOrBadValue(String?)
    case Unknown(String?)
    
    public func successful() -> Bool {
        switch self {
        case .Success:
            return true
        default:
            return false
        }

    }
    
}