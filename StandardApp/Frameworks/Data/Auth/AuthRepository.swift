//
//  LoginRepository.swift
//  StandardApp
//
//  Created by Rone Loza on 5/13/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation

protocol AuthRepository: class {
  
  func signupUser(request: SignupUserRequest, completion: @escaping (Result<Bool, SignupRepositoryError>) -> (Void))
  func signinUser(request: SigninUserRequest, completion: @escaping (Result<Bool, SigninRepositoryError>) -> (Void))
}
