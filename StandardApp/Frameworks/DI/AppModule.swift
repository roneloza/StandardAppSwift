//
//  AppModule.swift
//  StandardApp
//
//  Created by Rone Loza on 5/7/19.
//  Copyright © 2019 Developer Rone Loza. All rights reserved.
//

import Foundation
import GirdersSwift
import RxRetroSwift
import RxSwift

class AppModule: NSObject {
    
    func doRequestNetwork() {
        
        let caller = RequestCaller(config: URLSessionConfiguration.default)
    }
    
    static func injectDependencies() {
        
//        Container.addSingleton { () -> PDFService in
//            if #available(iOS 11, *) {
//                return PDFKitService()
//            } else {
//                return CGPDFService()
//            }
//        }
    }
}
