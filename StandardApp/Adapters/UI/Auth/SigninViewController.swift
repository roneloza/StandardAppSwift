//
//  ViewController.swift
//  StandardApp
//
//  Created by Rone Loza on 5/7/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit
import GirdersSwift

//MARK: - The configurator’s job is to hook up all the VIP components -

class LoginViewController: BaseViewController, DispatcherController, AlertableController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private lazy var interactor: SignupUseCaseInput = {
        
        let interactor = Container.resolve() as SignupUseCaseInput
        
        return interactor
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
}

//MARK: - IBActions -

private extension LoginViewController {
    
    @IBAction func didTapUpInsideLoginButton(_ sender: UIButton) {
        
        self.interactor.signupUser(request: SignupUserRequest(email: self.userNameTextField.text ?? "", password: self.passwordTextField.text ?? ""))
    }
}

extension LoginViewController: SignupPresenterOutput {
    
    
    func onDisplaySuccessSignupUser(_ value: Bool) {
        
        self.performSegue(withIdentifier: "loginSuccesSID", sender: nil)
    }
    
    func onDisplayFailureSignupUser(_ error: CustomError) {
        
        self.dispatchOnMainQueue {
            
            self.show(title: error.errorCode?.description, message: error.message, style: AlertableControllerStyle.alert, completion: nil)
            
            self.addAction(title: "Ok", style: AlertableControllerActionStyle.default, handler: nil)
        }
    }
}
