//
//  BaseTextField.swift
//  sign_in
//
//  Created by Student on 20/9/22.
//

import UIKit
import SnapKit

class BaseTextField: UIView{
    
    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Title"
        
        return label
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        
        return label
    }()
    
    private lazy var mainTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .green
        tf.delegate = self
        
        return tf
    }()
    

    
    init(){
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        self.addSubview(mainTitleLabel)
        self.addSubview(mainTextField)
        self.addSubview(errorLabel)
    }
    
    
    private func setupConstraints(){
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(14)
        }
        
        mainTextField.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextField.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
}

extension BaseTextField: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
