//
//  SignUpViewController.swift
//  VIPER_IOS
//
//  Created by Mushtaque Ahmed on 9/16/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
     private var presenter: SignUpPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignUpRouter.getSignUpPresenter()
        
        // Do any additional setup after loading the view.
    }
    
   @IBAction private func signUpBtnClick(_ sender: UIButton) {
    
    }
    
    private func startSignUpProcess(with userName: String, password: String) {
        presenter.signUp(with: userName, password: password, onSuccess: {[weak self] (isSuccess) in
            
            if(isSuccess) {
                print("SignUp Passed")
                self?.navigationController?.popViewController(animated: true)
            } else {
                print("SignUp Failed")
                
            }
        }) {
            print("SignUp Failed")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
