//
//  MainTableViewCell.swift
//  sign_in
//
//  Created by Student on 6/9/22.
//

import UIKit
import SnapKit

class MainTableViewCell: BaseTableViewCell{
    
    static let identifier = "MainTableViewCell"
    
    private lazy var mainView: UIView={
        let view = UIView()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = ComputedHeight(20)
        view.layer.masksToBounds = true
        
        return view
    }()
    
    
    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "power")
        
        return image
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "default"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    private lazy var descTitle: UILabel = {
        let label = UILabel ()
        label.text = "default description default description default description default description"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        contentView.addSubview(mainView)
        
        mainView.addSubview(mainImage)
        mainView.addSubview(mainTitle)
        mainView.addSubview(descTitle)
        
//        mainImage.backgroundColor = .red
//        mainTitle.backgroundColor = .green
//        descTitle.backgroundColor = .blue
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.size.equalTo(50)
        }
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.leading.equalTo(mainImage.snp.trailing).offset(10)
            make.height.equalTo(18)
        }
        
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(6)
            make.trailing.equalToSuperview().offset(-10)
            make.leading.equalTo(mainImage.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-6)
        }
        
    }
    
    
    
}
