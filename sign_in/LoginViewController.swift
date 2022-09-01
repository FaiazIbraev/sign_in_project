//
//  LoginViewController.swift
//  sign_in
//
//  Created by Student on 30/8/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController{
    
    var viewModel = LoginViewModel()
    private lazy var mainLabel : UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Sign in"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return mainLabel
    }()
    
    private lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        
        return iv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        sv.distribution = .fillEqually
        
        
        return sv
    }()
    
    private lazy var userNameTextField : UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Username"
        tf.setLeftPaddingPoints(22)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(60)
        } // dobavili vysotu odnomu text fieldu tak kak v stack dali fill equal
        
        return tf
    }()
    
    private lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Password"
        tf.setLeftPaddingPoints(22)
        tf.isSecureTextEntry = true
        tf.isUserInteractionEnabled = true
        tf.delegate = self
        
        return tf
    }()
    
    private lazy var secureIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "eye")
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureIconTapped))
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    private lazy var forgotPassButtonLabel : UILabel = {
        let forgot = UILabel()
        forgot.text = "Forgot you password?"
        forgot.textAlignment = .right
        forgot.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        forgot.font = .systemFont(ofSize: 16, weight: .semibold)
        forgot.isUserInteractionEnabled = true
        
        let tappedForgot = UITapGestureRecognizer(target: self, action: #selector(forgotPassTapped))
        forgot.addGestureRecognizer(tappedForgot)
        
        return forgot
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var lastLabelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    private lazy var doYouHaveAccountLabel : UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Don’t have an account?"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        
        return mainLabel
    }()
    
    private lazy var signUpLabel : UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Sign Up"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .left
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        mainLabel.backgroundColor = .gray
        
        let tappedForgot = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        mainLabel.addGestureRecognizer(tappedForgot)
        
        return mainLabel
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(mainLabel)
        view.addSubview(iconImage)
        view.addSubview(stackView)
        view.addSubview(secureIcon)
        view.addSubview(forgotPassButtonLabel)
        view.addSubview(loginButton)
        view.addSubview(lastLabelStack)
        
        
        [userNameTextField, passwordTextField].forEach{stackView.addArrangedSubview($0)} // dobavlenie v stack text fieldov. $0 kajdyi ob`ekt v massive
        
        [doYouHaveAccountLabel, signUpLabel].forEach{lastLabelStack.addArrangedSubview($0)}
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            
        }
        
        secureIcon.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalTo(passwordTextField.snp.trailing).inset(22)
            make.size.equalTo(30)
        }
        
        forgotPassButtonLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(14)
            make.trailing.equalToSuperview().inset(30)

        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPassButtonLabel).offset(50)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(60)
        }
        
        lastLabelStack.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(loginButton.snp.bottom).offset(160)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
        
        viewModel.isUserAuthorized = {
            (isAuthorized) in
            if isAuthorized{
                self.appDelegate.mainApp()
            }else{
                self.forgotPassButtonLabel
            }
        }
        
    }
    
    
}

extension LoginViewController{
    @objc func secureIconTapped(){
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
    }

    @objc func forgotPassTapped(){
        print("Forgot password tapped")
    }

    @objc func signUpTapped(){
        print("hi")
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped(){
        
        guard let login = userNameTextField.text, let password = passwordTextField.text else {return}
        
        if login.isEmpty && password.isEmpty {
            appDelegate.mainApp()
        }
        
        
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
