//
//  CreateUserRequest.swift
//  StandardApp
//
//  Created by Rone Loza on 5/13/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation

class SignupUserRequest {

    let email: String
    let password: String
    
    init(email: String,
         password: String) {
        
        self.email = email
        self.password = password
    }
}
