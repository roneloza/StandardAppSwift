//
//  UITextFieldIndicator.swift
//  StandardApp
//
//  Created by Rone Loza on 5/13/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import UIKit
import RxSwift

@IBDesignable class UITextFieldIndicator: UIView {
    
    @IBInspectable @IBOutlet weak var bottomLineView: UIView!
    @IBInspectable @IBOutlet weak var label: UILabel!
    @IBInspectable @IBOutlet weak var textField: UITextField!
    
    private let disposeBag = DisposeBag()
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.textField.rx.controlEvent(.editingDidEnd)
            .asObservable()
            .subscribe(onNext: { _ in
                
                self.bottomLineView.backgroundColor = UIColor.lightGray
            }).disposed(by: disposeBag)
        
        self.textField.rx.controlEvent(.editingDidBegin)
            .asObservable()
            .subscribe(onNext: { _ in
                
                self.bottomLineView.backgroundColor = UIColor.blue
            }).disposed(by: disposeBag)
        
        self.textField.rx.text.orEmpty.subscribe(onNext: { (text) in
            
            self.label.isHidden = !(text.count > 0)
        }).disposed(by: disposeBag)
    }
}
