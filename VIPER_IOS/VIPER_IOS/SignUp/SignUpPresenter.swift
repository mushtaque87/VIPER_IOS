//
//  SignUpPresenter.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/16/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation

final class SignUpPresenter {
    private var interactor: SignUpInteractorProtocol
    
    init(interactor: SignUpInteractorProtocol) {
        self.interactor = interactor
        
}
    
    func signUp(with userName: String,
               password: String,
               onSuccess:@escaping (Bool) -> Void,
               onFailure: @escaping () -> Void) {
        self.interactor.signUp(with: userName, password: password, onSuccess: { (success) in
            onSuccess(success)
        }) {
            onFailure()
        }
    }

}
