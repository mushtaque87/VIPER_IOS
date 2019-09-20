//
//  LoginInteractor.swift
//  pronounciation-test-tool
//
//  Created by Mushtaque Ahmed on 8/20/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
func login(with userName: String,
           password: String,
           onSuccess:@escaping (LoginModel) -> Void,
           onFailure: @escaping () -> Void)
}

final class LoginInteractor: LoginInteractorProtocol {
    private var loginService: LoginServiceProtocol
    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
}

    func login(with userName: String, password: String, onSuccess: @escaping (LoginModel) -> (), onFailure: @escaping () -> ()) {
        self.loginService.login(with: userName, password: password, onSuccess: { (logindetails) in
            onSuccess(logindetails)
        }) {
            onFailure()
        }
    }
    
    
}
