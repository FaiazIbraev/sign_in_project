//
//  ProfileViewController.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import UIKit
import SnapKit

class ProfileViewController: BaseViewController{
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = .systemFont(ofSize: 22, weight: .bold)

        
        return label
    }()
    
//    private lazy var mailBaseButton = BaseButton(.email)
//    private lazy var passBaseButton = BaseButton(.password)
//    private lazy var confirmPassBaseButton = BaseButton(.confirmPass)
    
    private lazy var profileTF: UIView = {
        let tf = BaseTextField()
        
        return tf
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(mainLabel)
        view.addSubview(profileTF)
//        view.addSubview(mailBaseButton)
//        view.addSubview(passBaseButton)
//        view.addSubview(confirmPassBaseButton)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        

        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(22)
            
        }
        
        profileTF.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
        }
//        mailBaseButton.snp.makeConstraints { make in
//            make.top.equalTo(mainLabel.snp.bottom).offset(20)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(100)
//
//        }
//
//        passBaseButton.snp.makeConstraints { make in
//            make.top.equalTo(mailBaseButton.snp.bottom).offset(20)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(100)
//
//        }
//
//        confirmPassBaseButton.snp.makeConstraints { make in
//            make.top.equalTo(passBaseButton.snp.bottom).offset(20)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(100)
//
//        }

    }
    

}


    
    
