//
//  LoginService.swift
//  StandardApp
//
//  Created by Rone Loza on 5/13/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService: AuthRepository {
  
  func signupUser(request: SignupUserRequest, completion: @escaping (Result<Bool, SignupRepositoryError>) -> (Void)) {
    
    FirebaseAuth.Auth.auth().createUser(withEmail: request.email, password: request.password) { (result, error) in
      
      if let firebaseError = error as NSError? {

        let customError = SignupRepositoryError()
        customError.errorCode = firebaseError.code
        customError.message = firebaseError.localizedDescription
        
        completion(.failure(customError))
        completion(.success(true))
      }
      else {
        
        completion(.success(true))
      }
    }
  }
  
  func signinUser(request: SigninUserRequest, completion: @escaping (Result<Bool, SigninRepositoryError>) -> (Void)) {
    
    FirebaseAuth.Auth.auth().signIn(withEmail: request.email, password: request.password) { (result, error) in
      
      if let firebaseError = error as NSError? {
        
        let customError = SigninRepositoryError()
        customError.errorCode = firebaseError.code
        customError.message = firebaseError.localizedDescription
        
        completion(.failure(customError))
      }
      else {
        
        completion(.success(true))
      }
    }
  }
  
}
