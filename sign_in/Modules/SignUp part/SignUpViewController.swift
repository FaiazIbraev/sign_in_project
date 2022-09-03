//
//  SignUpViewController.swift
//  sign_in
//
//  Created by Student on 1/9/22.
//

import UIKit
import SnapKit

class SignUpViewController : BaseViewController{
    
    private lazy var backButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "path")
        image.contentMode = .scaleAspectFit
        
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(backTapped)
        
        return image
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo2")
        
        return image
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    
    private lazy var emailTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter email"
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.setLeftPaddingPoints(22)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(60)
        } // dobavili vysotu odnomu text fieldu tak kak v stack dali fill equal
        
        return tf
    }()
    
    private lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter password"
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.setLeftPaddingPoints(22)
        tf.delegate = self
        
        return tf
    }()
    
    private lazy var confirmPasswordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.setLeftPaddingPoints(22)
        tf.delegate = self
        
        return tf
    }()
    
    private lazy var secureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eye")
        image.contentMode = .scaleAspectFit
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureIconTapped))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(iconTapped)
        
        return image
    }()
    
    private lazy var secureImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eye")
        image.contentMode = .scaleAspectFit
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureIconTapped2))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(iconTapped)
        
        return image
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return button
    }()
    
    
    private lazy var lastStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    private lazy var alreadyHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .blue
        label.textAlignment = .left
        
        label.isUserInteractionEnabled = true
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(signInTapped))
        
        
        label.addGestureRecognizer(labelTapped)
        
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(mainLabel)
        view.addSubview(logoImage)
        view.addSubview(stack)
        view.addSubview(secureImage)
        view.addSubview(secureImage2)
        view.addSubview(signUpButton)
        view.addSubview(lastStack)
        view.addSubview(backButton)
    }

    override func setupConstraints() {
        super.setupConstraints()
        
        [emailTextField, passwordTextField,confirmPasswordTextField].forEach{stack.addArrangedSubview($0)} // dobavlenie v stack text fieldov. $0 kajdyi ob`ekt v massive
        
        [alreadyHaveAccountLabel, signInLabel].forEach{lastStack.addArrangedSubview($0)} // dobavlenie v stack text fieldov. $0 kajdyi ob`ekt v massive
        
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(16)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
        
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(120)
            make.trailing.equalToSuperview().offset(-120)
            make.height.equalTo(140)
        }
        
        stack.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        secureImage.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-22)
            make.size.equalTo(30)
        }
        
        secureImage2.snp.makeConstraints { make in
            make.centerY.equalTo(confirmPasswordTextField.snp.centerY)
            make.trailing.equalTo(confirmPasswordTextField.snp.trailing).offset(-22)
            make.size.equalTo(30)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(160)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
    }
    
    
    
    
}

extension SignUpViewController{
    
    @objc func signInTapped(){
        print("signInTapped")
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func secureIconTapped(){
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
    }
    
    @objc func secureIconTapped2(){
        self.confirmPasswordTextField.isSecureTextEntry = !self.confirmPasswordTextField.isSecureTextEntry
    }
    
    @objc func backButtonTapped(){
        print("backButtonTapped")
        navigationController?.popViewController(animated: true)
    }
    
}



extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
