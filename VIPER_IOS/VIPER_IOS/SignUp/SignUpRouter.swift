//
//  SignUpRouter.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/16/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation
import UIKit



final class SignUpRouter {
    
    class func getSignUpPresenter() -> SignUpPresenter {
        return SignUpPresenter(interactor: SignUpInteractor(signUpService: SignUpServiceManager()))
    }
    
    
    
    class private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
