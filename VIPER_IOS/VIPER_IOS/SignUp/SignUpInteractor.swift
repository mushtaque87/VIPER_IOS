//
//  SignUpInteractor.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/16/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation


protocol SignUpInteractorProtocol {
    func signUp(with userName: String,
               password: String,
               onSuccess:@escaping (Bool) -> Void,
               onFailure: @escaping () -> Void)
}

final class SignUpInteractor: SignUpInteractorProtocol {
    
    private var signUpService: SignUpServiceProtocol
    init(signUpService: SignUpServiceProtocol) {
        self.signUpService = signUpService
}

    func signUp(with userName: String, password: String, onSuccess: @escaping (Bool) -> Void, onFailure: @escaping () -> Void) {
        
        self.signUpService.signUp(with: userName, password: password, onSuccess: { (signUpdetails) in
            if(signUpdetails.success == 200 ) {
                onSuccess(true)
            } else {
                onSuccess(false)
            }
        }) {
            onFailure()
            
        }
        
    }

}
