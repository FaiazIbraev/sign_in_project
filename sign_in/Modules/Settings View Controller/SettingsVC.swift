//
//  SettingsVC.swift
//  sign_in
//
//  Created by Faiaz Ibraev on 6/9/22.
//

import UIKit
import SnapKit

class SettingsVC: BaseViewController{
    
    private lazy var backButton: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "path")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    private lazy var mainLabel: UILabel = {
        var label = UILabel()
        label.text = "Settings"
        label.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private lazy var stack: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.axis = .vertical
        
        
        return stack
    }()
    
    private lazy var cardLabel: UILabel = {
        var label = UILabel()
        label.text = "Payment cards"
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        
        label.snp.makeConstraints { make in
            make.height.equalTo(ComputedHeight(80))
        }
        
        return label
    }()
    
    private lazy var writeLabel: UILabel = {
        var label = UILabel()
        label.text = "Write to us"
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        var label = UILabel()
        label.text = "Rate us on app store"
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        
        return label
    }()
    
    private lazy var aboutLabel: UILabel = {
        var label = UILabel()
        label.text = "About us"
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        
        return label
    }()
    
    private lazy var forwardButton1: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "forward")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var forwardButton2: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "forward")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var forwardButton3: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "forward")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var forwardButton4: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "forward")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var logOutLabel: UILabel = {
        var label = UILabel()
        label.text = "Log out"
        label.textColor = UIColor(red: 1, green: 0.694, blue: 0.616, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(backButton)
        view.addSubview(mainLabel)
        view.addSubview(stack)
        view.addSubview(forwardButton1)
        view.addSubview(forwardButton2)
        view.addSubview(forwardButton3)
        view.addSubview(forwardButton4)
        view.addSubview(logOutLabel)
        
    }
    
    
    override func setupConstraints() {
        super.setupConstraints()
        

        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(ComputedHeight(30))
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(ComputedHeight(16))
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(ComputedHeight(30))
            make.leading.equalToSuperview().offset(138)
            make.trailing.equalToSuperview().offset(-138)
        }

        stack.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(ComputedHeight(50))
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)

        }
        

        [cardLabel, writeLabel, rateLabel, aboutLabel].forEach{stack.addArrangedSubview($0)}

        logOutLabel.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(ComputedHeight(30))
            make.leading.equalToSuperview().offset(30)
        }
        
    }
    
}

