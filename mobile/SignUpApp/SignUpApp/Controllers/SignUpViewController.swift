//
//  ViewController.swift
//  SignUpApp
//
//  Created by Cory Kim on 2020/03/23.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var identificationTextField: SignUpTextField!
    @IBOutlet weak var passwordTextField: SignUpTextField!
    @IBOutlet weak var passwordReconfirmationTextField: SignUpTextField!
    @IBOutlet weak var nameTextField: SignUpTextField!
    @IBOutlet weak var nextButton: SignUpNextButton!
    
    let identificationTextFieldDelegate = SignUpTextFieldDelegate()
    let passwordTextFieldDelegate = SignUpTextFieldDelegate()
    let passwordReconfirmationTextFieldDelegate = SignUpTextFieldDelegate()
    let nameTextFieldDelegate = SignUpTextFieldDelegate()
    
    let signUpViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFieldDelegate()
        
        signUpViewModel.signUpValidationChangeHandler = { isValid in
            DispatchQueue.main.async {
                self.nextButton.isValid = isValid
            }
        }
    }
    
    private func setupTextFieldDelegate() {
        identificationTextField.delegate = identificationTextFieldDelegate
        passwordTextField.delegate = passwordTextFieldDelegate
        passwordReconfirmationTextField.delegate = passwordReconfirmationTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
        setupTextFieldDelegateHandler()
    }
    
    private func setupTextFieldDelegateHandler() {
        identificationTextFieldDelegate.handleTextChanged = { identificaion in
            self.signUpViewModel.identification = identificaion
        }
        passwordTextFieldDelegate.handleTextChanged = { password in
            self.signUpViewModel.password = password
        }
        passwordReconfirmationTextFieldDelegate.handleTextChanged = { passwordReconfirmation in
            self.signUpViewModel.passwordReconfirmation = passwordReconfirmation
        }
        nameTextFieldDelegate.handleTextChanged = { name in
            self.signUpViewModel.name = name
        }
    }
}
