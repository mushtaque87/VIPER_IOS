//
//  LoginRouter.swift
//  SAALE-CLIENT_IOS
//
//  Created by Toyaj Nigam on 6/24/18.
//  Copyright © 2018 Saal. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    func getSignUpScreen() -> SignUpViewController
    func getProfileScreen() -> ProfileViewController
}


final class LoginRouter : LoginRouterProtocol {

    
     func getSignUpScreen() -> SignUpViewController {
        let signUpViewController = self.mainStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        return signUpViewController!
    }
    
     func getProfileScreen() -> ProfileViewController {
        let profileViewController = self.mainStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        return profileViewController!
    }
    
    
     private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
