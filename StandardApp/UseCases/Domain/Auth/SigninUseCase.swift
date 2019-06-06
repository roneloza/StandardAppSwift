//
//  BusinessLoginFactory.swift
//  StandardApp
//
//  Created by Rone Loza on 5/13/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation

protocol SigninUseCaseOutput: class {

  func onSuccessSigninUser(_ value: Bool)
  func onFailureSigninUser(_ error: CustomError)
  
}

protocol SigninUseCaseInput: class {
  
  var output: SigninUseCaseOutput? { set get }
  
  func signinUser(request: SigninUserRequest, completion: @escaping (Result<Bool, SigninUseCaseError>) -> ())
}

class SigninUseCase: SigninUseCaseInput {
  
  var output: SigninUseCaseOutput?
  
  private let service: AuthRepository
  
  init(service: AuthRepository) {
    
    self.service = service
  }
  
  func signinUser(request: SigninUserRequest, completion: @escaping (Result<Bool, SigninUseCaseError>) -> ()) {
    
    self.service.signinUser(request: request) { result -> (Void) in
      
      switch result {
      case .success(let value):
        
        self.output?.onSuccessSigninUser(value)
        
      case .failure(let error):
        
        self.output?.onFailureSigninUser(error)
      }
    }
  }
  
}
