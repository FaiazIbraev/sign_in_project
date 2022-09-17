//
//  ProfileViewController.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import UIKit
import SnapKit

class ProfileViewController: BaseViewController{
    
    private lazy var historyBaseButton = BaseButton()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(historyBaseButton)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        historyBaseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }
    
    
}
