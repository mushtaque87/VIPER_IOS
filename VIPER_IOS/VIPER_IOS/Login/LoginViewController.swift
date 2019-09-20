//
//  NewLoginViewController.swift
//  SAALE-CLIENT_IOS
//
//  Created by Toyaj Nigam on 6/24/18.
//  Copyright © 2018 Saal. All rights reserved.
//

import UIKit



final class LoginViewController: UIViewController {
    
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginBtn: UIButton!
    @IBOutlet weak private var userNameTxtField: UITextField!


    private var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = LoginPresenter(interactor: LoginInteractor(loginService: ServiceManager()), router: LoginRouter())
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
    }
    
   
    private func startLoginProcess(with userName: String, password: String) {
     
        presenter.login(with: userName, password: password, onSuccess: {[weak self] (isSuccess) in
           
            if(isSuccess) {
                 print("Login Passed")
                self?.showProfileScreen()
            } else {
                print("Login Failed")
                self?.showSignUpScreen()
            }
        }) {
            print("Login Failed")
            self.showSignUpScreen()
            
        }
    }
    
    private func clearTextFields() {
        self.view.endEditing(true)
        self.userNameTxtField.text = ""
        self.passwordTextField.text = ""
    }
    
    @IBAction private func loginBtnClick(_ sender: UIButton) {
        let userName = self.userNameTxtField.text
        let password = self.passwordTextField.text
        
        if let userName = userName, let password = password {
            startLoginProcess(with: userName, password: password)
        }
    }
    
    func showSignUpScreen() {
        let signUpVC = presenter.showSignUpScreen()
        self.navigationController?.pushViewController(signUpVC, animated: true)

    }
    
    func showProfileScreen() {
        let profileVC = presenter.showProfileScreen()
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        if textField == self.passwordTextField {
            return newLength <= 50
        } else {
            return newLength <= 50
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
