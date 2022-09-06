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
        tv.rowHeight = 80
        tv.isScrollEnabled = false
        
        return tv
    }()
    
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
    
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        return cell
    }
    
    
}
