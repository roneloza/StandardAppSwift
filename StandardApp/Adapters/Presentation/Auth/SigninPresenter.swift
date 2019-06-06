//
//  SigninPresenter.swift
//  StandardApp
//
//  Created by Rone Loza on 5/15/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

protocol SigninPresenterInput: SigninUseCaseOutput {
  
  var output: SigninPresenterOutput? { get set }
}

protocol SigninPresenterOutput: SigninUseCaseOutput {
  
  func onDisplaySuccessSigninUser(_ value: Bool)
  func onDisplayFailureSigninUser(_ error: CustomError)
}

class SigninPresenter: SigninPresenterInput {
  
  var output: SigninPresenterOutput?
  
  func onSuccessSigninUser(_ value: Bool) {
    
    self.output?.onDisplaySuccessSigninUser(value)
  }
  
  func onFailureSigninUser(_ error: CustomError) {
    
    self.output?.onDisplayFailureSigninUser(error)
  }
  
}
