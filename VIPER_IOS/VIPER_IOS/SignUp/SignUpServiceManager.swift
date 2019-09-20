//
//  SignUpService.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/16/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation
import UIKit


protocol SignUpServiceProtocol {
    func signUp(with userName: String,
               password: String,
               onSuccess: @escaping (SignUpModel) -> Void,
               onFailure: @escaping () -> Void)
    
}

final class SignUpServiceManager: SignUpServiceProtocol {
    
    func signUp(with userName: String,
               password: String,
               onSuccess: @escaping (SignUpModel) -> Void,
               onFailure: @escaping () -> Void) {
        
        let data = Helper.readJsonFile(at: "SignUpJSON" , ofType: "txt")
        let decoder = JSONDecoder()
        let signUpdetails = try! decoder.decode(SignUpModel.self, from: data!)
        onSuccess(signUpdetails)
        
    }
    
}
