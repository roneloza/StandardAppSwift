//
//  NetworkRequestResource.swift
//  StandardApp
//
//  Created by Rone Loza on 5/8/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

enum NetworkRequestRawContentType {
    
    case PLAIN
    case JSON
}

enum NetworkRequestMethod {
    
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
    case HEAD
}

enum NetworkRequestBodyEncode {
    
    case Raw
    case FormData
    case FormURLEncoded
}

protocol NetworkRequestMessage: class {

    var path: String? { get }
    var url: URL? { get }
    var baseURL: String? { get }
    var method: NetworkRequestMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var authHeaders: [String: String]? { get }
    var bodyEncode: NetworkRequestBodyEncode { get }
    var contentType: NetworkRequestRawContentType { get }
}

extension NetworkRequestMessage {
    
    var path: String? {
        
        get {
            
            return nil
        }
    }
    
    var url: URL? {
        
        get {
            
            return nil
        }
    }
    
    var baseURL: String? {
        
        get {
            
            return nil
        }
    }
    
    var method: NetworkRequestMethod {
        
        get {
            
            return .GET
        }
    }
    
    var headers: [String: String]? {
        
        get {
            
            return nil
        }
    }
    
    var parameters: [String: Any]? {
        
        get {
            
            return nil
        }
    }
    
    var authHeaders: [String: String]? {
        
        get {
            
            return nil
        }
    }
    
    var bodyEncode: NetworkRequestBodyEncode {
        
        get {
            
            return .Raw
        }
    }
    
    var contentType: NetworkRequestRawContentType {
        
        get {
            
            return .JSON
        }
    }
    
}
