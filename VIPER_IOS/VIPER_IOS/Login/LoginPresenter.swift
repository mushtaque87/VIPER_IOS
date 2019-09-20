//
//  LoginPresenter.swift
//  pronounciation-test-tool
//
//  Created by Mushtaque Ahmed on 8/20/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation

final class LoginPresenter {
    private var interactor: LoginInteractorProtocol
    private var router: LoginRouterProtocol
    
    init(interactor: LoginInteractorProtocol , router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func login(with userName: String,
               password: String,
               onSuccess:@escaping (Bool) -> Void,
               onFailure: @escaping () -> Void) {
        self.interactor.login(with: userName, password: password, onSuccess: { (logindetails) in
            if(logindetails.username == userName ) {
                onSuccess(true)
            } else {
                onSuccess(false)
            }
        }) {
            onFailure()
        }
    }
    
    func showSignUpScreen() -> SignUpViewController {
        return router.getSignUpScreen()
    }
    
    func showProfileScreen() -> ProfileViewController {
        return router.getProfileScreen()
        
    }
    
}
