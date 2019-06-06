//
//  NetworkSessionRetroClient.swift
//  StandardApp
//
//  Created by Rone Loza on 5/9/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation
import RxRetroSwift
import RxSwift

class NetworkSessionRetroClient: NetworkSessionClient {
    
    private let caller: RequestCaller
    private let disposeBag = DisposeBag()
    private let baseUrl = ""
    
    override init() {
        
        let config = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        }
        
        self.caller = RequestCaller(config: config)
    }
        
    func GET<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
       
        let request:URLRequest = RequestModel(
            httpMethod: .get,
            path: request.path!,
            baseUrl: (request.baseURL ?? self.baseUrl),
            query: request.parameters,
            payload: [:],
            headers: [:]
            ).asURLRequest()
        
        let observable: Observable<Result<T, E>> = caller.call(request)
        
        observable.subscribe(onNext: { (result) in
            
            if let error = result.error {
                
                completion(.failure(error))
            }
            
            completion(.successful(result.value))
        }).disposed(by: disposeBag)
    }
    
    func POST<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
        
    }
}
