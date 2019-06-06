//
//  ControllerDispatcher.swift
//  StandardApp
//
//  Created by Rone Loza on 5/20/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation

protocol DispatcherController {
  
  func dispatchOnMainQueue(block: @escaping () -> Void)
  func dispatchOnMainQueue(delay: TimeInterval, block: @escaping () -> Void)
}

extension DispatcherController {
  
  func dispatchOnMainQueue(block: @escaping () -> Void) {
    
    DispatchQueue.main.async {
      
      block()
    }
  }
  
  func dispatchOnMainQueue(delay: TimeInterval, block: @escaping () -> Void) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      
      block()
    }
  }
}
