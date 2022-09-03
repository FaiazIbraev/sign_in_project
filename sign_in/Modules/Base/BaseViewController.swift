//
//  BaseViewController.swift
//  sign_in
//
//  Created by Student on 30/8/22.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupValues()

       
        
    }
    
    func setupViews(){
        view.backgroundColor = .white
    }
    
    func setupConstraints(){
        
    }
    
    func setupValues(){
        
    }
    
}
