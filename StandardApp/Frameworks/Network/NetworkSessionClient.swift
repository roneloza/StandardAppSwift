//
//  NetworkSessionClient.swift
//  StandardApp
//
//  Created by Rone Loza on 5/8/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation

class NetworkSessionClient {

    func GET<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
        
    }
    
    func POST<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
        
    }
}
