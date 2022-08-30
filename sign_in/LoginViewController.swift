//
//  LoginViewController.swift
//  sign_in
//
//  Created by Student on 30/8/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController{
    
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
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(mainLabel)
        view.addSubview(iconImage)
        view.addSubview(stackView)
        passwordTextField.addSubview(secureIcon)
        
        [userNameTextField, passwordTextField].forEach{stackView.addArrangedSubview($0)} // dobavlenie v stack text fieldov. $0 kajdyi ob`ekt v massive
        
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
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22)
            make.size.equalTo(30)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
        
        
    }
    
    
}

extension LoginViewController{
    @objc func secureIconTapped(){
        self.passwordTextField.isSecureTextEntry = false
    }
}
