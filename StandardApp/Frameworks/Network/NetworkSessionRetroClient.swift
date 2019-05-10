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
    
    private let caller = RequestCaller(config: URLSessionConfiguration.default)
    private let disposeBag = DisposeBag()
    
    func GET<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
       
        let request:URLRequest = RequestModel(
            httpMethod: .get,
            path: request.path!,
            baseUrl: "",
            query: [:],
            payload: [:],
            headers: [:]
            ).asURLRequest()
        
        let observable: Observable<Result<T, NetworkError>> = caller.call(request)
        
        observable.subscribe(onNext: { (result) in
            
            if let error = result.error as? E {
                
                completion(.failure(error))
            }
            
            completion(.successful(result.value))
        }).disposed(by: disposeBag)
    }
    
    func POST<T: NetworkResponseCodable, E: NetworkError>(request: NetworkRequestMessage, completion: @escaping (Result<T?, E>) -> ()) {
        
    }
}
