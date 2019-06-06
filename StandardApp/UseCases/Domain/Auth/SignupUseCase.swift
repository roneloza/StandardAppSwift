//
//  SinpUpInteractor.swift
//  StandardApp
//
//  Created by Rone Loza on 5/15/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

protocol SignupUseCaseOutput: class {
    
    func onSuccessSignupUser(_ value: Bool)
    func onFailureSignupUser(_ error: CustomError)
    
}

protocol SignupUseCaseInput: class {
    
    var presenter: SignupUseCaseOutput? { get }
    func signupUser(request: SignupUserRequest)
}


class SignupUseCase: SignupUseCaseInput {
    
    var presenter: SignupUseCaseOutput?
    private let service: AuthRepository
    
    init(service: AuthRepository, presenter: SignupUseCaseOutput?) {
        
        self.service = service;
        self.presenter = presenter
    }
    
    func signupUser(request: SignupUserRequest) {
        
        self.service.signupUser(request: request) { result -> (Void) in
            
            switch result {
            case .success(let value):
                
                self.presenter?.onSuccessSignupUser(value)
                
            case .failure(let error):
                
                self.presenter?.onFailureSignupUser(error)
            }
            
        }
    }
    
}
