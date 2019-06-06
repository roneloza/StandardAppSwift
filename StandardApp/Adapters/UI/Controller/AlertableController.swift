//
//  AlertController.swift
//  StandardApp
//
//  Created by Rone Loza on 5/21/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit

public enum AlertableControllerStyle : Int {
  
  case alert
  
  case actionSheet
}

public enum AlertableControllerActionStyle : Int {
  
  case `default`
  
  case cancel
  
  case destructive
}

protocol AlertableController: class {
  
  var alert: UIAlertController? { set get }
  
  func show(title: String?, message: String?, style: AlertableControllerStyle, completion: (() -> ())?)
  
  func hide(completion: (() -> ())?)
  
  func addAction(title: String?, style: AlertableControllerActionStyle, handler: (() -> ())?) 
}

extension AlertableController where Self: UIViewController {
  
  func show(title: String?, message: String?, style: AlertableControllerStyle, completion: (() -> ())?) {
    
    if let alert = self.alert {
      
      alert.title = title;
      alert.message = message
      let preferredStyle = (style == AlertableControllerStyle.alert ? UIAlertController.Style.alert : UIAlertController.Style.actionSheet)
      
      if (preferredStyle != alert.preferredStyle) {
        
        self.alert = UIAlertController(title: title, message: message, preferredStyle: (style == AlertableControllerStyle.alert ? UIAlertController.Style.alert : UIAlertController.Style.actionSheet))
      }
    }
    else {
      
      self.alert = UIAlertController(title: title, message: message, preferredStyle: (style == AlertableControllerStyle.alert ? UIAlertController.Style.alert : UIAlertController.Style.actionSheet))
    }
    
    self.present(self.alert!, animated: true, completion: completion)
  }
  
  func hide(completion: (() -> ())?) {
    
    self.dismiss(animated: true, completion: completion)
  }
  
  func addAction(title: String?, style: AlertableControllerActionStyle, handler: (() -> ())?) {
   
    self.alert?.addAction(UIAlertAction(title: title, style: (style == AlertableControllerActionStyle.default ? UIAlertAction.Style.default : (style == AlertableControllerActionStyle.cancel ? UIAlertAction.Style.cancel : UIAlertAction.Style.destructive)), handler: { (action) in
      
      if let handler = handler {
        
        handler()
      }
    }))
  }
}
