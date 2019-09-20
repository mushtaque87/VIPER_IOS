//
//  ServiceManager.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/14/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import UIKit
import Foundation

protocol LoginServiceProtocol {
    func login(with userName: String,
               password: String,
               onSuccess: @escaping (LoginModel) -> Void,
               onFailure: @escaping () -> Void)
    
}

final class ServiceManager: LoginServiceProtocol {
    
    func login(with userName: String,
               password: String,
               onSuccess: @escaping (LoginModel) -> Void,
               onFailure: @escaping () -> Void) {
        
        let data = Helper.readJsonFile(at: "LoginJSON" , ofType: "txt")
        let decoder = JSONDecoder()
        let logindetails = try! decoder.decode(LoginModel.self, from: data!)
        onSuccess(logindetails)
        //print("uid : \(logindetails.uid!)")
    }
    
}
