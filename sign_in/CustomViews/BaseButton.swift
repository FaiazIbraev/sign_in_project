//
//  BaseButton.swift
//  sign_in
//
//  Created by Student on 17/9/22.
//


import UIKit

class BaseButton: UIView{
    
    
    init(){
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    
    func setupConstraints(){
        
    }
    
}
