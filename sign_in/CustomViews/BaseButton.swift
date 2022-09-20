//
//  BaseButton.swift
//  sign_in
//
//  Created by Student on 17/9/22.
//


import UIKit
import SnapKit

class BaseButton: UIView, UITextFieldDelegate{
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.backgroundColor = .green
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Placeholder"
        tf.borderStyle = .line
        tf.isUserInteractionEnabled = true
        tf.delegate = self
        
        return tf
    }()
    
    private lazy var incorrectPassLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    var type : BaseButtonType
    
    init(_ type: BaseButtonType){
        self.type = type
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews(){

        self.addSubview(descLabel)
        self.addSubview(userTextField)
        self.addSubview(incorrectPassLabel)
    }
    
    
    private func setupConstraints(){

        descLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(18)
        }
        
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.height.equalTo(18)
        }
        
        incorrectPassLabel.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.height.equalTo(18)
    
        }
        
    }
    
    private func setupValues(){
        descLabel.text = type.title
        incorrectPassLabel.text = type.incorrectPass
    }
    
}
    


extension BaseButton{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("asdasd")
    }
}



