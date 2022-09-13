//
//  DetailedVC.swift
//  sign_in
//
//  Created by Student on 13/9/22.
//

import UIKit
import SnapKit

class DetailedVC: BaseViewController{
    
    private lazy var backButton: UIImageView = {
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "path")
        back.layer.cornerRadius = ComputedHeight(10)
        back.layer.borderWidth = 2
        back.layer.borderColor = UIColor.green.cgColor
        
        return back
    }()
    
    
    private lazy var posterImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "joker")
        
        return iv
    }()
    
    private lazy var descStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.spacing = ComputedHeight(20)
        stack.axis = .horizontal
        
        return stack
    }()
    
    private lazy var linkToHomeLabel: UILabel = {
        let link = UILabel ()
        link.font = .systemFont(ofSize: 16, weight: .semibold)
        link.textColor = .white
        link.text = "Marvel.com"
        link.textAlignment = .center
        
        return link
    }()
    
    private lazy var ratingLabel: UILabel = {
        let rating = UILabel ()
        rating.font = .systemFont(ofSize: 16, weight: .semibold)
        rating.textColor = .white
        rating.text = "Rating"
        rating.textAlignment = .center
        
        return rating
    }()
    
    private lazy var genreLabel: UILabel = {
        let genre = UILabel ()
        genre.font = .systemFont(ofSize: 16, weight: .semibold)
        genre.textColor = .white
        genre.text = "Comedy"
        genre.textAlignment = .center
        
        return genre
    }()
    
    private lazy var durationLabel: UILabel = {
        let duration = UILabel ()
        duration.font = .systemFont(ofSize: 16, weight: .semibold)
        duration.textColor = .white
        duration.text = "1 hour"
        duration.textAlignment = .center
        
        return duration
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .darkGray
        
        view.addSubview(backButton)
        view.addSubview(posterImage)
        view.addSubview(descStackView)
        
        [linkToHomeLabel, ratingLabel, genreLabel, durationLabel].forEach{descStackView.addArrangedSubview($0)}
        
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(ComputedHeight(20))
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(30)
        }
        
        posterImage.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(ComputedWidth(16))
            make.height.equalTo(ComputedHeight(400))
        }
        
        descStackView.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(ComputedWidth(16))
            make.height.equalTo(ComputedHeight(20))
        }
        
    }
}
