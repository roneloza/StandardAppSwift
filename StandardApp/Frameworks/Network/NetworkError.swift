//
//  NetworkError.swift
//  StandardApp
//
//  Created by Rone Loza on 5/9/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import RxRetroSwift
import RxSwift

class NetworkError: DecodableError, Error {
    
    var errorDetail: String?
    var errorCode:Int?
    var message:String?
    var details:[String:String]?
    
    required init() {
        
    }
}
