//
//  AppModule.swift
//  StandardApp
//
//  Created by Rone Loza on 5/7/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation
import GirdersSwift

class AppModule: NSObject {
  
  static func injectDependencies() {
    
    AuthModule.injectSignupUseCase()
    AuthModule.injectAuthRepository()
    AuthModule.injectSignupPresenter()
  }
  
//  static func injectNetworkSessionClient() {
//    
//    Container.addPerRequest { () -> NetworkSessionClient in
//      
//      return NetworkSessionRetroClient()
//    }
//  }
}
