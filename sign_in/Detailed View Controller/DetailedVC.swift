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
        back.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        back.tintColor = .white
        back.layer.cornerRadius = ComputedHeight(10)
        back.layer.borderWidth = 1
        back.layer.borderColor = UIColor.white.cgColor
     
        back.isUserInteractionEnabled = true
        let backButtonTapped = UITapGestureRecognizer(target: self, action: #selector(backButtonTappedFunc))
        back.addGestureRecognizer(backButtonTapped)
        
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

    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel ()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.text = "Joker"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var descTitleLabel: UILabel = {
        let label = UILabel ()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.text = "descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc"
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let networkManager = NetworkManager()
    
    let id: Int
    let posterPath: String
    
    init(id: Int, posterPath: String){
        self.id = id
        self.posterPath = posterPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .darkGray
        
        view.addSubview(backButton)
        view.addSubview(posterImage)
        view.addSubview(descStackView)
        view.addSubview(mainTitleLabel)
        view.addSubview(descTitleLabel)
        
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
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(ComputedWidth(16))
            make.height.equalTo(22)
        }
        
        descTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(ComputedWidth(16))
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
        getPoster()
        getMovieData()
    }
    
    func getMovieData(){
        networkManager.getDetailedData(id: id) { (response) in
            DispatchQueue.main.async {
                self.mainTitleLabel.text = response.original_title
                self.descTitleLabel.text = response.overview
                self.linkToHomeLabel.text = response.homepage
                self.ratingLabel.text = response.original_language
                self.genreLabel.text = response.genres?[0].name
                self.durationLabel.text = "\(response.runtime ?? 0)"
            }
        }
    }
    
    func getPoster(){
            networkManager.getImage(endPath: posterPath) { [weak self] (imageData) in
                DispatchQueue.main.async {
                    self?.posterImage.image = UIImage(data: imageData)
            }
        }
    }
    
}

extension DetailedVC{
    @objc func backButtonTappedFunc(){
        appDelegate.navController?.popViewController(animated: true)
        print("Back button")
    }
    
}
