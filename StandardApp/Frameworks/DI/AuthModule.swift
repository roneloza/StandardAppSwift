//
//  AuthModule.swift
//  StandardApp
//
//  Created by Rone Loza on 5/17/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import GirdersSwift

class AuthModule: NSObject {
    
    static func injectSignupPresenter() {
        
        Container.addPerRequest { () -> SignupPresenterInput in
            
            return SignupPresenter()
        }
    }
    
    static func injectSignupUseCase() {
        
        Container.addPerRequest { () -> SignupUseCaseInput in
            
            let authRepository: AuthRepository = Container.resolve()
            let presenter: SignupPresenterInput = Container.resolve()
            
            return SignupUseCase(service: authRepository, presenter: presenter)
        }
    }
    
    static func injectAuthRepository() {
        
        Container.addPerRequest { () -> AuthRepository in
            
            return FirebaseAuthService()
        }
    }
    
}

//import UIKit
//
//class AuthModule: NSObject {
//
//  private lazy var networkSessionClient: NetworkSessionClient = (Container.resolve())
//  private lazy var authService: AuthRepository = Container.resolve()
//}
