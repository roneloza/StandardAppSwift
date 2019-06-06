//
//  SigninPresenter.swift
//  StandardApp
//
//  Created by Rone Loza on 5/15/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

protocol SignupPresenterInput: SignupUseCaseOutput {
   
    var display: SignupPresenterOutput? { get }
}

protocol SignupPresenterOutput: class {
    
    func onDisplaySuccessSignupUser(_ value: Bool)
    func onDisplayFailureSignupUser(_ error: CustomError)
}

class SignupPresenter: SignupPresenterInput {
    
    var display: SignupPresenterOutput?
    
    func onSuccessSignupUser(_ value: Bool) {
        
        self.display?.onDisplaySuccessSignupUser(value)
    }
    
    func onFailureSignupUser(_ error: CustomError) {
        
        self.display?.onDisplayFailureSignupUser(error)
    }
    
}
