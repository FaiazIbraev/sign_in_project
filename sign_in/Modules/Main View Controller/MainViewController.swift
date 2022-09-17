//
//  MainViewController.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController{
    
    private lazy var mainTitle: UILabel = {
        let title = UILabel()
        title.text = "Main page"
        title.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        title.textAlignment = .center
        
        return title
    }()
    

    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.delegate = self
        tv.dataSource = self
        tv.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tv.estimatedRowHeight = 60
        tv.rowHeight = UITableView.automaticDimension
        tv.isScrollEnabled = true
        
        return tv
    }()
    
    var popularMovies: PopularMovies?
    
    var viewModel: MainViewModelProtocol
    init(viewModel: MainViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(mainTitle)
        view.addSubview(mainTableView)
        
    }
    
    override func setupConstraints() {
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
    
    override func setupValues() {
        super.setupValues()
        viewModel.getPopularMovies { [weak self] (movies) in
            self?.popularMovies = movies
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies = popularMovies, let result = movies.results  else {return 0}
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        if let popularMovies = popularMovies, let result = popularMovies.results{
            let movie = result[indexPath.row]
            cell.config(movie: movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let popularMovies = popularMovies, let result = popularMovies.results{
            let movie = result[indexPath.row]
            let id: Int = movie.id ?? 0
            let posterPath: String = movie.poster_path ?? ""
            
            let vc = DetailedVC(id: id, posterPath: posterPath)
            
            appDelegate.navController?.pushViewController(vc, animated: true)
            
            print("Tap to movie")
        }
    }
    
}
