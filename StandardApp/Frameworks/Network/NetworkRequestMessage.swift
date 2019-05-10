//
//  NetworkRequestResource.swift
//  StandardApp
//
//  Created by Rone Loza on 5/8/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

enum NetworkRequestMethod {
    
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
    case HEAD
}

protocol NetworkRequestMessage: class {

    var path: String? { get }
    var url: URL? { get }
    var baseURL: String? { get }
    var method: NetworkRequestMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var authHeaders: [String: String]? { get }
    var mergeHeaders: [String: String]? { get }
    var bodyEncode: NetworkBodyEncode { get }
    var contentType: NetworkContentType { get }
}
